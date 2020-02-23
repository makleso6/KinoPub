//
//  BookmarkFactory.swift
//  KinoPub
//
//  Created by Maksim Kolesnik on 07/03/2020.
//  Copyright (c) 2020 Maksim Kolesnik. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

public final class BookmarkFactory: TransitionFactory {
    public typealias ModuleInputType = BookmarkPresenterInput
    public typealias ViewType = BookmarkViewController

    private let networkService: NetworkServiceFactory
    public init() {
        let keyValueStorage = KeyChainStorageFactory().lazyKeyValueStorage
        let accessTokenService = DefaultAccessTokenService(keyValueStorage: keyValueStorage)
        self.networkService = MoyaNetworkServiceFactory(accessTokenService: accessTokenService)
    }

    public func instantiateModuleTransitionHandler() -> ViewType {
        let interactor = BookmarkInteractor(networkService: networkService)
        let router = BookmarkRouter()
        let presenter = BookmarkPresenter(interactor: interactor, router: router)
    	let viewController = ViewType(presenter: presenter)

        presenter.view = viewController
        interactor.output = presenter
        router.output = presenter
        router.viewController = viewController
        return viewController
    }

}