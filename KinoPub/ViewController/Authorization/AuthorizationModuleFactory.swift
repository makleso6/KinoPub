//
//  AuthorizationModuleFactory.swift
//  KinoPub
//
//  Created by Maksim Kolesnik on 22/02/2020.
//  Copyright © 2020 Maksim Kolesnik. All rights reserved.
//

import UIKit

public class AuthorizationModuleFactory {
    public var viewController: UIViewController {
        let keyValueStorage = ServiceLocator.shared.keyChainStorage
        let accessTokenService = DefaultAccessTokenServiceFactory(keyValueStorage: keyValueStorage).lazyAccessTokenService
        let networkService = MoyaNetworkServiceFactory(accessTokenService: accessTokenService).lazyNetworkService
        let authorizationService = DefaultAuthorizationServiceFactory(networkService: networkService).lazyAuthorizationService
        let model = AuthorizationViewModel(accessTokenService: accessTokenService,
                                           authorizationService: authorizationService)
        let viewController = AuthorizationViewController(model: model)
        return viewController
    }
}
