//
//  NetworkRequestType.swift
//  KinoPub
//
//  Created by Maksim Kolesnik on 17/02/2020.
//  Copyright © 2020 Maksim Kolesnik. All rights reserved.
//

import Foundation
import Moya

public protocol NetworkRequestType: AccessTokenAuthorizable {
    /// The target's base `URL`.
    var url: URL? { get }

    /// The path to be appended to `baseURL` to form the full `URL`.
    var path: String { get }

    /// The HTTP method used in the request.
    var method: Moya.Method { get }

    /// Provides stub data for use in testing.
    var sampleData: Data { get }

    /// The type of HTTP task to be performed.
    var task: Moya.Task { get }

    /// The type of validation to perform on the request. Default is `.none`.
    var validationType: Moya.ValidationType { get }

    /// The headers to be used in the request.
    var headers: [String: String]? { get }
}

extension NetworkRequestType {

    public var authorizationType: AuthorizationType? {
        return .none
    }

    /// The type of validation to perform on the request. Default is `.none`.
    public var validationType: Moya.ValidationType {
        .none
    }

    public var sampleData: Data {
        .init()
    }
    public var headers: [String: String]? {
        [:]
    }

}
