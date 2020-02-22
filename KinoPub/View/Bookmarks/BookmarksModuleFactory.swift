//
//  BookmarksModuleFactory.swift
//  KinoPub
//
//  Created by Maksim Kolesnik on 22/02/2020.
//  Copyright © 2020 Maksim Kolesnik. All rights reserved.
//

import UIKit

public final class BookmarksModuleFactory {
    public var viewController: UIViewController {
        let keyValueStorage = ServiceLocator.shared.keyChainStorage
        let accessTokenService = DefaultAccessTokenServiceFactory(keyValueStorage: keyValueStorage).accessTokenService
        let networkService = MoyaNetworkServiceFactory(accessTokenService: accessTokenService).networkService
        let model = BookmarksViewModel(networkService: networkService)
        let viewController = BookmarksViewController(model: model)
        return viewController

    }
}
