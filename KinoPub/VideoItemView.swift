//
//  VideoItemView.swift
//  KinoPub
//
//  Created by Maksim Kolesnik on 22/02/2020.
//  Copyright © 2020 Maksim Kolesnik. All rights reserved.
//

import SwiftUI
import Moya
import Combine

struct SeasonRowView: View {
    let item: Season
    var action: () -> Void
    public var body: some View {
        Button(action: action) {
            HStack {
                Text(item.title)
                Spacer()
                Text("\(item.number)")
            }
            
        }
    }
}

extension Season: Identifiable {
    public var id: Int {
        return number
    }
}

struct VideoItemView: View {
    @ObservedObject var viewModel: VideoItemViewModel
    public var body: some View {
        List(viewModel.seasons) { item -> SeasonRowView in
            SeasonRowView(item: item) {
                self.viewModel.didSelect(item: item)
            }
        }
    }
}

struct ItemRequest: ApiTargetType {
    var serializer: DataResponseSerializer { .init() }
    
    typealias ResponseSerializerType = DataResponseSerializer
    
    var path: String {
        "items/\(id)"
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

struct ItemResponse: Codable {
    let status: Int
    let item: Item
}

class VideoItemViewModel: ObservableObject {
    let model: Bookmark.Item
    
    var dispose = Set<AnyCancellable>()
    @Published private(set) var seasons: [Season] = []
    public var callBack = PassthroughSubject<Season, Never>()

    lazy var plugin: PluginType = {
        TokenPlugin(accessTokenService: accessTokenService)
    }()
    
    lazy var accessTokenService: AccessTokenService = {
        DefaultAccessTokenService(keyValueStorage: KeyChainStorage())
    }()
    
    lazy var networkService: CombineNetworkService = {
        
        return MoyaNetworkService(plugins: [plugin])
    }()
    
    func didSelect(item: Season) {
        callBack.send(item)
    }
    
    init(model: Bookmark.Item) {
        self.model = model
        networkService.execute(ItemRequest(id: model.id))
        .decode(type: ItemResponse.self, decoder: JSONDecoder())
            .compactMap({ $0.item.seasons })
        .catch({ (error) -> Empty<[Season], Never> in
            print(error)

            return Empty()
        })
        .assign(to: \.seasons, on: self)
        .store(in: &dispose)
    }

}
