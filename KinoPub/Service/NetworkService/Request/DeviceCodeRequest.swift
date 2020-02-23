//
//  DeviceCodeRequest.swift
//  KinoPub
//
//  Created by Maksim Kolesnik on 22/02/2020.
//  Copyright © 2020 Maksim Kolesnik. All rights reserved.
//

import Moya

public struct DeviceCodeRequest: AuthTargetType {
    public var serializer: DecodableResponseSerializer<DeviceCodeResponse> { .init() }
    public var path: String { "device" }
    public var method: Moya.Method { .post }
    public var validationType: ValidationType { .successCodes }
    public var task: Moya.Task {
        .requestParameters(parameters:
            [
                "grant_type": "device_code",
                "client_id": Secret.clientId,
                "client_secret": Secret.clientSecret
            ],
                           encoding: URLEncoding.queryString)
    }
}

public struct DeviceCodeResponse: Codable {
    public enum CodingKeys: String, CodingKey {
        case code
        case userCode = "user_code"
        case verificationURI = "verification_uri"
        case interval
        case expiresIn = "expires_in"
    }
    public let code: String
    public let userCode: String
    public let verificationURI: String
    public let interval: Int
    public let expiresIn: Int
}
