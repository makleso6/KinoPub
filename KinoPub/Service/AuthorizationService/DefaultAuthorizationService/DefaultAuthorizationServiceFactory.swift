//
//  DefaultAuthorizationServiceFactory.swift
//  KinoPub
//
//  Created by Maksim Kolesnik on 22/02/2020.
//  Copyright © 2020 Maksim Kolesnik. All rights reserved.
//

import Foundation

public final class DefaultAuthorizationServiceFactory: AuthorizationServiceFactory {

    private let networkService: CombineNetworkService

    public lazy var lazyAuthorizationService: AuthorizationService = {
        return DefaultAuthorizationService(networkService: networkService)
    }()

    public init(networkService: CombineNetworkService) {
        self.networkService = networkService
    }
}
