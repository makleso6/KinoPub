//
//  BookmarksViewModel.swift
//  KinoPub
//
//  Created by Maksim Kolesnik on 22/02/2020.
//  Copyright © 2020 Maksim Kolesnik. All rights reserved.
//

import Combine

class BookmarksViewModel: ObservableObject {
    @Published private(set) var models: [Bookmark] = []
    private var dispose = Set<AnyCancellable>()
    public var callBack = PassthroughSubject<Bookmark, Never>()
    private let networkService: CombineNetworkService
    
    public func didSelect(item: Bookmark) {
        callBack.send(item)
    }
    
    init(networkService: CombineNetworkService) {
        self.networkService = networkService
        
        networkService.execute(BookmarksRequest())
            .map({ $0.items })
            .catch({ (error) -> Empty<[Bookmark], Never> in
                print(error)
                return Empty()
            })
            .assign(to: \.models, on: self)
            .store(in: &dispose)
    }
}


