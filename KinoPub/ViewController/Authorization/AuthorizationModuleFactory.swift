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
        let keyValueStorage = KeyChainStorageFactory()
        let accessTokenService = DefaultAccessTokenServiceFactory(keyValueStorage: keyValueStorage)
        let networkService = MoyaNetworkServiceFactory(accessTokenService: accessTokenService)
        let authorizationService = DefaultAuthorizationServiceFactory(networkService: networkService,
                                                                      accessTokenService: accessTokenService)
        let model = AuthorizationViewModel(accessTokenService: accessTokenService.lazyAccessTokenService,
                                           authorizationService: authorizationService.lazyAuthorizationService)
        let viewController = AuthorizationViewController(model: model)
        return viewController
    }
}
