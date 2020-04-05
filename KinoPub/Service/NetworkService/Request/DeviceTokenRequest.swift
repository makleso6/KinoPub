//
//  DeviceTokenRequest.swift
//  KinoPub
//
//  Created by Maksim Kolesnik on 22/02/2020.
//  Copyright © 2020 Maksim Kolesnik. All rights reserved.
//

import Moya

public struct DeviceTokenRequest: AuthTargetType {
    public var serializer: DecodableResponseSerializer<AccessToken> { .init() }
    public var path: String { "device" }
    public var method: Moya.Method { .post }
    public var validationType: ValidationType { .successCodes }
    public var task: Moya.Task {
        .requestParameters(parameters:
            [
                "grant_type": "device_token",
                "code": code,
                "client_id": Secret.clientId,
                "client_secret": Secret.clientSecret
            ],
                           encoding: URLEncoding.queryString)
    }
    private let code: String
    public init(code: String) {
        self.code = code
    }
}
