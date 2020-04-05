//
//  ErrorHandlingNetworkServiceFactory.swift
//  KinoPub
//
//  Created by Maksim Kolesnik on 05/04/2020.
//  Copyright © 2020 Maksim Kolesnik. All rights reserved.
//

import Foundation

public final class ErrorHandlingNetworkServiceFactory: NetworkServiceFactory {
    private let networkService: NetworkServiceFactory
    private let authorizationService: AuthorizationServiceFactory
    public lazy var lazyNetworkService: CombineNetworkService = {
        return ErrorHandlingNetworkService(networkService: networkService,
                                           authorizationService: authorizationService)
    }()

    public init(networkService: NetworkServiceFactory,
                authorizationService: AuthorizationServiceFactory) {
        self.networkService = networkService
        self.authorizationService = authorizationService
    }
}
