//
//  AnyReqest.swift
//  KinoPub
//
//  Created by Maksim Kolesnik on 13/03/2020.
//  Copyright © 2020 Maksim Kolesnik. All rights reserved.
//

import Foundation
import Moya

public final class AnyJSONReqest<D>: DecodingTargetType, CacheableTargetType where D: Decodable {
    public typealias ResponseSerializerType = DecodableResponseSerializer<D>
    public var serializer: ResponseSerializerType { return .init() }
    public var path: String { return "" }
    public let method: Moya.Method
    public let url: URL?
    public let task: Moya.Task
    public let customHeaders: [String: String]
    public init(baseURL: URL?,
                task: Moya.Task = Moya.Task.requestPlain,
                method: Moya.Method = Moya.Method.get,
                customHeaders: [String: String] = [:]) {
        self.url = baseURL
        self.task = task
        self.method = method
        self.customHeaders = customHeaders
    }
}

public  final class AnyDataReqest: DecodingTargetType {
    public typealias ResponseSerializerType = DataResponseSerializer
    public var serializer: ResponseSerializerType { return .init() }
    public var path: String { return "" }
    public let method: Moya.Method
    public let url: URL?
    public let task: Moya.Task
    public let customHeaders: [String: String]
    public init(baseURL: URL?,
                task: Moya.Task = Moya.Task.requestPlain,
                method: Moya.Method = Moya.Method.get,
                customHeaders: [String: String] = [:]) {
        self.url = baseURL
        self.task = task
        self.method = method
        self.customHeaders = customHeaders
    }
}

public  final class AnyURLReqest: DecodingTargetType {
    public typealias ResponseSerializerType = EmptyResponseSerializer
    public var serializer: ResponseSerializerType { return .init() }
    public var path: String { return "" }
    public let method: Moya.Method
    public let url: URL?
    public let task: Moya.Task
    public let customHeaders: [String: String]
    public let validationType: Moya.ValidationType
    public init(baseURL: URL?,
                task: Moya.Task = Moya.Task.requestPlain,
                method: Moya.Method = Moya.Method.get,
                validationType: Moya.ValidationType = .successAndRedirectCodes,
                customHeaders: [String: String] = [:]) {
        self.url = baseURL
        self.task = task
        self.method = method
        self.customHeaders = customHeaders
        self.validationType = validationType
    }
}
