//
//  DefaultAuthorizationService.swift
//  KinoPub
//
//  Created by Maksim Kolesnik on 22/02/2020.
//  Copyright © 2020 Maksim Kolesnik. All rights reserved.
//

import Combine
import Foundation

public enum DefaultAuthorizationServiceError: Error {
    case emptyAccessToken
}

public final class DefaultAuthorizationService: AuthorizationService {
    private let networkService: NetworkServiceFactory
    private let accessTokenService: AccessTokenServiceFactory
    public init(networkService: NetworkServiceFactory,
                accessTokenService: AccessTokenServiceFactory) {
        self.networkService = networkService
        self.accessTokenService = accessTokenService
    }

    public func getDevice() -> AnyPublisher<DeviceCodeResponse, Error> {
         networkService
            .lazyNetworkService
            .execute(DeviceCodeRequest())
            .eraseToAnyPublisher()
    }

    public func getToken(_ response: DeviceCodeResponse) -> AnyPublisher<AccessToken, Error> {
        let def = Deferred {
            self.networkService
                .lazyNetworkService
                .execute(DeviceTokenRequest(code: response.code))
                .delay(for: .seconds(response.interval), tolerance: .none, scheduler: DispatchQueue.global(), options: .none)
        }
            
        return def.retry(3)
            .handleEvents(receiveSubscription: { (sub) in
                print("receiveSubscription", sub)
            }, receiveOutput: { (token) in
                print("receiveOutput", token)
            }, receiveCompletion: { (comp) in
                print("receiveCompletion", comp)
            }, receiveCancel: {
                print("receiveCancel")
            }, receiveRequest: { (dem) in
                print("receiveRequest", dem)
            })
            .handleEvents(receiveOutput: { [weak self] token in
                guard let self = self else { return }
                self.accessTokenService.lazyAccessTokenService.set(token: token)
            })
//            .catch({ [weak self] (error) -> AnyPublisher<AccessToken, Error> in
//                guard let self = self else { return Fail(error: error).eraseToAnyPublisher() }
//                return self.getToken(response)
//            })
//            .flatMap({ CurrentValueSubject($0) })

            .eraseToAnyPublisher()
    }

    public func refreshAccessToken() -> AnyPublisher<AccessToken, Error> {
        guard let accessToken: AccessToken = accessTokenService.lazyAccessTokenService.token() else {
            return Fail(error: DefaultAuthorizationServiceError.emptyAccessToken).eraseToAnyPublisher()
        }
        return networkService
            .lazyNetworkService
            .execute(RefreshTokenRequest(refreshRoken: accessToken.refreshToken))
            .handleEvents(receiveOutput: { [weak self] token in
                guard let self = self else { return }
                self.accessTokenService.lazyAccessTokenService.set(token: token)
                })
            .eraseToAnyPublisher()
    }
}
