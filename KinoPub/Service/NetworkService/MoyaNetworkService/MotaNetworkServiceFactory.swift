//
//  MotaNetworkServiceFactory.swift
//  KinoPub
//
//  Created by Maksim Kolesnik on 22/02/2020.
//  Copyright © 2020 Maksim Kolesnik. All rights reserved.
//

import Foundation
import Moya
import Combine

public final class MoyaNetworkServiceFactory: NetworkServiceFactory {
    private let accessTokenService: AccessTokenServiceFactory

    private lazy var tokenPlugin: PluginType = {
        TokenPlugin(accessTokenService: accessTokenService)
    }()

    public lazy var lazyNetworkService: CombineNetworkService = {
        return MoyaNetworkService(plugins: [tokenPlugin])
    }()

    public init(accessTokenService: AccessTokenServiceFactory) {
        self.accessTokenService = accessTokenService
    }
}
