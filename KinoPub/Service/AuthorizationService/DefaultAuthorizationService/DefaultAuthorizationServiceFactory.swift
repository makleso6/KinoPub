//
//  DefaultAuthorizationServiceFactory.swift
//  KinoPub
//
//  Created by Maksim Kolesnik on 22/02/2020.
//  Copyright © 2020 Maksim Kolesnik. All rights reserved.
//

import Foundation

public final class DefaultAuthorizationServiceFactory: AuthorizationServiceFactory {

    private let networkService: NetworkServiceFactory
    private let accessTokenService: AccessTokenServiceFactory

    public lazy var lazyAuthorizationService: AuthorizationService = {
        return DefaultAuthorizationService(networkService: networkService,
                                           accessTokenService: accessTokenService)
    }()

    public init(networkService: NetworkServiceFactory,
                accessTokenService: AccessTokenServiceFactory) {
        self.networkService = networkService
        self.accessTokenService = accessTokenService
    }
}
