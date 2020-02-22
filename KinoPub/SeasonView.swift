//
//  SeasonView.swift
//  KinoPub
//
//  Created by Maksim Kolesnik on 22/02/2020.
//  Copyright © 2020 Maksim Kolesnik. All rights reserved.
//

import SwiftUI
import Moya
import Combine

struct EpisodeRowView: View {
    let item: Episode
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

extension Episode: Identifiable { }

struct SeasonView: View {
    @ObservedObject var viewModel: SeasonViewModel
    public var body: some View {
        List(viewModel.episodes) { item -> EpisodeRowView in
            EpisodeRowView(item: item) {
                self.viewModel.didSelect(item: item)
            }
        }
    }
}

class SeasonViewModel: ObservableObject {
//    let model: Bookmark.Item
    let episodes: [Episode]
    public var callBack = PassthroughSubject<Episode, Never>()

//    var dispose = Set<AnyCancellable>()
//    @Published private(set) var seasons: [Season] = []

//    lazy var plugin: PluginType = {
//        let credentialsPlugin = TokenPlugin(tokenClosure: { [weak self] (type) -> String? in
//            return self?.accessTokenService.accessToken?.accessToken
//        })
//        return credentialsPlugin
//    }()
//
//    lazy var accessTokenService: AccessTokenService = {
//        DefaultAccessTokenService(keyValueStorage: KeyChainStorage())
//    }()
//
//    lazy var networkService: CombineNetworkService = {
//
//        return MoyaNetworkService(plugins: [plugin])
//    }()
    func didSelect(item: Episode) {
        callBack.send(item)
    }
    init(season: Season) {
        self.episodes = season.episodes
//        networkService.execute(ItemRequest(id: model.id))
//        .decode(type: ItemResponse.self, decoder: JSONDecoder())
//            .compactMap({ $0.item.seasons })
//        .catch({ (error) -> Empty<[Season], Never> in
//            print(error)
//
//            return Empty()
//        })
//        .assign(to: \.seasons, on: self)
//        .store(in: &dispose)
    }

}
