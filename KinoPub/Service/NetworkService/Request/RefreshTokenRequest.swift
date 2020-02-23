//
//  RefreshTokenRequest.swift
//  KinoPub
//
//  Created by Maksim Kolesnik on 06/03/2020.
//  Copyright © 2020 Maksim Kolesnik. All rights reserved.
//

import Moya

public struct RefreshTokenRequest: AuthTargetType {
    public var serializer: DecodableResponseSerializer<AccessToken> { .init() }
    public var path: String { "device" }
    public var method: Moya.Method { .post }
    public var validationType: ValidationType { .successCodes }
    public var task: Moya.Task {
        .requestParameters(parameters:
            [
                "grant_type": "refresh_token",
                "client_id": Secret.clientId,
                "client_secret": Secret.clientSecret,
                "refresh_token": refreshRoken
            ],
                           encoding: URLEncoding.queryString)
    }
    private let refreshRoken: String
    public init(refreshRoken: String) {
        self.refreshRoken = refreshRoken
    }
}
