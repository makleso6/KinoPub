//
//  TokenPlugin.swift
//  KinoPub
//
//  Created by Maksim Kolesnik on 22/02/2020.
//  Copyright © 2020 Maksim Kolesnik. All rights reserved.
//

import Moya
import Foundation

public struct TokenPlugin: PluginType {

    private let accessTokenService: AccessTokenService
    public init(accessTokenService: AccessTokenService) {
        self.accessTokenService = accessTokenService
    }

    public func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {

        guard let authorizable = target as? AccessTokenAuthorizable,
            let authorizationType = authorizable.authorizationType
            else { return request }

        var request = request
        let token: AccessToken? = accessTokenService.token()
        guard let value = token?.accessToken else { return request }
        let authValue = authorizationType.value + " " + value
        request.addValue(authValue, forHTTPHeaderField: "Authorization")

        return request
    }
}
