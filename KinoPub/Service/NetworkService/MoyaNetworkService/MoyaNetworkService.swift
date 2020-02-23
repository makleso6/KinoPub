//
//  MoyaNetworkService.swift
//  KinoPub
//
//  Created by Maksim Kolesnik on 17/02/2020.
//  Copyright © 2020 Maksim Kolesnik. All rights reserved.
//

import Foundation
import Moya
import Combine

public struct AnyTarget: TargetType, AccessTokenAuthorizable {

    private let request: NetworkRequestType
    public let baseURL: URL

    public init(request: NetworkRequestType) throws {
        self.request = request
        guard let url = request.url else { throw NetworkServiceError.invalidUrl }
        self.baseURL = url
    }
    public var authorizationType: AuthorizationType? {
        return request.authorizationType
    }

    public var path: String {
        return request.path
    }

    public var method: Moya.Method {
        return request.method
    }

    public var sampleData: Data {
        return request.sampleData
    }

    public var task: Task {
        return request.task
    }

    public var headers: [String: String]? {
        return request.headers
    }

    public var validationType: Moya.ValidationType {
        return request.validationType
    }
}

public final class MoyaNetworkService {
    public typealias Target = AnyTarget
    private let moyaProvider: MoyaProvider<Target>
    public init(endpointClosure: @escaping MoyaProvider<Target>.EndpointClosure = MoyaProvider.defaultEndpointMapping,
                requestClosure: @escaping MoyaProvider<Target>.RequestClosure = MoyaProvider<Target>.defaultRequestMapping,
                stubClosure: @escaping MoyaProvider<Target>.StubClosure = MoyaProvider.neverStub,
                callbackQueue: DispatchQueue? = nil,
                session: Session = MoyaProvider<Target>.defaultAlamofireSession(),
                plugins: [PluginType] = [],
                trackInflights: Bool = false) {

        moyaProvider = .init(endpointClosure: endpointClosure,
                             requestClosure: requestClosure,
                             stubClosure: stubClosure,
                             callbackQueue: callbackQueue,
                             session: session,
                             plugins: plugins,
                             trackInflights: trackInflights)
    }
}

public final class EmptyCancellable: Moya.Cancellable {
    public var isCancelled: Bool = false
    public func cancel() {
        isCancelled = true
    }
}

extension MoyaNetworkService: NetworkService {

    @discardableResult
    public func execute<R>(_ request: R,
                           callbackQueue: DispatchQueue?,
                           progress: ProgressBlock?,
                           completion: @escaping (Result<R.ResponseSerializerType.EntityType, Error>) -> Void) -> Moya.Cancellable where R: DecodingTargetType {

        do {
            let target = try AnyTarget(request: request)
            return moyaProvider.request(target, callbackQueue: callbackQueue, progress: progress, completion: { (result) in
                switch result {
                case .success(let response):
                    completion(.init(catching: {
                        try request.serializer.process(response)
                    }))

                case .failure(let error):
                    completion(Result.failure(NetworkServiceError.error(error)))
                }
            })
        } catch {
            if let networkError = error as? NetworkServiceError {
                completion(Result.failure(networkError))
            } else {
                completion(Result.failure(NetworkServiceError.error(error)))
            }
            return EmptyCancellable()
        }
    }
}

extension MoyaNetworkService: CombineNetworkService {
    public func execute<R>(_ request: R) -> AnyPublisher<R.ResponseSerializerType.EntityType, Error>  where R: DecodingTargetType {
        return Future({ [weak self] (promise) in
            guard let self = self else { return }
            self.execute(request, callbackQueue: nil, progress: nil, completion: promise)
        }).eraseToAnyPublisher()
    }

}
