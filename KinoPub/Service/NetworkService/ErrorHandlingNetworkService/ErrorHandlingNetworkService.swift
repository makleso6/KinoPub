//
//  ErrorHandlingNetworkService.swift
//  KinoPub
//
//  Created by Maksim Kolesnik on 05/04/2020.
//  Copyright © 2020 Maksim Kolesnik. All rights reserved.
//

import Foundation
import Combine
import Moya
import Alamofire

public final class ErrorHandlingNetworkService: CombineNetworkService {
    // MARK: - Private Properties

    private var disposable = Set<AnyCancellable>()

    private let networkService: NetworkServiceFactory
    private let authorizationService: AuthorizationServiceFactory

    // MARK: - Initializator

    public init(networkService: NetworkServiceFactory,
                authorizationService: AuthorizationServiceFactory) {
        self.networkService = networkService
        self.authorizationService = authorizationService
    }

    // MARK: - FutureNetworkService
    // swiftlint:disable cyclomatic_complexity
    public func execute<R>(_ request: R) -> AnyPublisher<R.ResponseSerializerType.EntityType, Error> where R: DecodingTargetType {
        return networkService
            .lazyNetworkService
            .execute(request)
            .catch({ [weak self] (error) -> AnyPublisher<R.ResponseSerializerType.EntityType, Error> in
                guard let self = self else { return Fail(error: error).eraseToAnyPublisher() }
                switch error {
                case NetworkServiceError.error(let moyaError):
                    switch moyaError {
                    case MoyaError.statusCode:
                        return Fail(error: error).eraseToAnyPublisher()
                    case MoyaError.underlying(let afError, _):
                        switch afError {
                        case AFError.responseValidationFailed(reason: let reason):
                            switch reason {
                            case .unacceptableStatusCode(code: let code):
                                switch code {
                                case 401:
//                                    let refreshToken =
                                    return self.authorizationService.lazyAuthorizationService.refreshAccessToken()
                                        .flatMap({ _ in
                                                return self.execute(request)
                                        })
                                        .eraseToAnyPublisher()
                                    
                                case 500:
                                    let failuerCacheableRequest = CacheableRequest(wrapped: request, cachePolicy: .returnCacheDataDontLoad)
                                    return self.execute(failuerCacheableRequest)
                                default:
                                    return Fail(error: error).eraseToAnyPublisher()
                                }
                            default:
                                return Fail(error: error).eraseToAnyPublisher()
                            }
                        case URLError.notConnectedToInternet:
                            let failuerCacheableRequest = CacheableRequest(wrapped: request, cachePolicy: .returnCacheDataDontLoad)
                            return self.execute(failuerCacheableRequest)
                        case URLError.resourceUnavailable:
                            return Fail(error: error).eraseToAnyPublisher()
                        case URLError.timedOut:
                            let failuerCacheableRequest = CacheableRequest(wrapped: request, cachePolicy: .returnCacheDataDontLoad)
                            return self.execute(failuerCacheableRequest)
                        default:
                            return Fail(error: error).eraseToAnyPublisher()
                        }
                    default:
                        return Fail(error: error).eraseToAnyPublisher()
                    }
                default:
                    return Fail(error: error).eraseToAnyPublisher()
                }
            })
            .eraseToAnyPublisher()
    }
    
    @discardableResult
    public func execute<R>(_ request: R,
                           callbackQueue: DispatchQueue?,
                           progress: ProgressBlock?,
                           completion: @escaping (Result<R.ResponseSerializerType.EntityType, Error>) -> Void) -> Moya.Cancellable where R: DecodingTargetType {
        let anyCancelable = execute(request)
            .sink(receiveCompletion: { (receiveCompletion) in
                if case .failure(let error) = receiveCompletion {
                    completion(.failure(error))
                }
            }, receiveValue: { (value) in
                completion(.success(value))
            })

        return AnyCancelableMoyaWrapper(anyCancelable: anyCancelable)
    }
}
