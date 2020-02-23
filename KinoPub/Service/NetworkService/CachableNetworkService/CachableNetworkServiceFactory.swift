//
//  CachableNetworkServiceFactory.swift
//  KinoPub
//
//  Created by Maksim Kolesnik on 06/03/2020.
//  Copyright © 2020 Maksim Kolesnik. All rights reserved.
//

import Foundation

public final class CachableNetworkServiceFactory: NetworkServiceFactory {
    private let underluing: CachableNetworkServiceFactory

    public lazy var lazyNetworkService: CombineNetworkService = {
        return CachableNetworkService(underluing: underluing.lazyNetworkService)
    }()

    public init(underluing: CachableNetworkServiceFactory) {
        self.underluing = underluing
    }
}
