//
//  BookmarkView.swift
//  KinoPub
//
//  Created by Maksim Kolesnik on 22/02/2020.
//  Copyright © 2020 Maksim Kolesnik. All rights reserved.
//

import SwiftUI
import Moya
import Combine


struct VideoItemRowView: View {
    let item: Bookmark.Item
    var action: () -> Void
    public var body: some View {
        Button(action: action) {
            HStack {
                Text(item.title)
                Spacer()
                Text("\(item.id)")
            }
            
        }
    }
}

extension Item: Identifiable { }
extension Bookmark.Item: Identifiable { }

struct BookmarkView: View {
    @ObservedObject var viewModel: BookmarkViewModel
    public var body: some View {
        List(viewModel.models) { item -> VideoItemRowView in
            VideoItemRowView(item: item) {
                print(item)
                self.viewModel.didSelect(item: item)
            }
        }
    }
}

struct BookmarkRequest: ApiTargetType {
    var serializer: DataResponseSerializer { .init() }
    
    typealias ResponseSerializerType = DataResponseSerializer
    
    var path: String {
        "bookmarks/\(id)"
    }
    
    var method: Moya.Method {
        .get
    }
    
    var task: Moya.Task {
        .requestPlain
    }
    let id: Int
    init(id: Int) {
        self.id = id
    }
}

struct BookmarkResponse: Codable {    
    let status: Int
    let folder: Folder
    let items: [Bookmark.Item]
    let pagination: Pagination
}

class BookmarkViewModel: ObservableObject {
    let model: Bookmark
    var dispose = Set<AnyCancellable>()
    public var callBack = PassthroughSubject<Bookmark.Item, Never>()

    @Published private(set) var models: [Bookmark.Item] = []

    lazy var plugin: PluginType = {
        TokenPlugin(accessTokenService: accessTokenService)
    }()
    
    lazy var accessTokenService: AccessTokenService = {
        DefaultAccessTokenService(keyValueStorage: KeyChainStorage())
    }()
    
    lazy var networkService: CombineNetworkService = {
        
        return MoyaNetworkService(plugins: [plugin])
    }()
    
    func didSelect(item: Bookmark.Item) {
        callBack.send(item)
    }
    
    init(model: Bookmark) {
        self.model = model
        
        networkService.execute(BookmarkRequest(id: model.id))
        .decode(type: BookmarkResponse.self, decoder: JSONDecoder())
        .map({ $0.items })
        .catch({ (error) -> Empty<[Bookmark.Item], Never> in
            print(error)

            return Empty()
        })
        .assign(to: \.models, on: self)
        .store(in: &dispose)

        
    }
}
