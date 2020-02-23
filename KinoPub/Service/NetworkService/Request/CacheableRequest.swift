//
//  CacheableRequest.swift
//  KinoPub
//
//  Created by Maksim Kolesnik on 06/03/2020.
//  Copyright © 2020 Maksim Kolesnik. All rights reserved.
//

import Moya
import Foundation

public final class CacheableRequest<T>: DecodingTargetType, CacheableTargetType where T: DecodingTargetType {
    public typealias ResponseSerializerType = T.ResponseSerializerType
    public var serializer: ResponseSerializerType { wrapped.serializer }
    public var path: String { wrapped.path }
    public var method: Moya.Method { wrapped.method }
    public var task: Moya.Task { wrapped.task }
    public var validationType: Moya.ValidationType { wrapped.validationType }
    public var url: URL? { wrapped.url }
    public var sampleData: Data { return wrapped.sampleData }
    public var headers: [String: String]? { return wrapped.headers }
    public let cachePolicy: URLRequest.CachePolicy
    private let wrapped: T
    public init(wrapped: T,
                cachePolicy: URLRequest.CachePolicy) {
        self.wrapped = wrapped
        self.cachePolicy = cachePolicy
    }
}
