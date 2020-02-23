//
//  DefaultAuthorizationService.swift
//  KinoPub
//
//  Created by Maksim Kolesnik on 22/02/2020.
//  Copyright © 2020 Maksim Kolesnik. All rights reserved.
//

import Combine
import Foundation

public final class DefaultAuthorizationService: AuthorizationService {
    private let networkService: CombineNetworkService
    public init(networkService: CombineNetworkService) {
        self.networkService = networkService

    }

    public func getDevice() -> AnyPublisher<DeviceCodeResponse, Error> {
         networkService.execute(DeviceCodeRequest())
            .eraseToAnyPublisher()
    }

    public func getToken(_ response: DeviceCodeResponse) -> AnyPublisher<AccessToken, Error> {
        networkService.execute(DeviceTokenRequest(code: response.code))
            .delay(for: .seconds(response.interval), tolerance: .none, scheduler: DispatchQueue.global(), options: .none)
            .decode(type: AccessToken.self, decoder: JSONDecoder())
            .catch({ [weak self] (error) -> AnyPublisher<AccessToken, Error> in
                guard let self = self else { return Fail(error: error).eraseToAnyPublisher() }
                return self.getToken(response)
            })
            .eraseToAnyPublisher()
    }

    public func refreshAccessToken(_ accessToken: AccessToken) -> AnyPublisher<AccessToken, Error> {
        networkService.execute(RefreshTokenRequest(refreshRoken: accessToken.refreshToken))
    }
}
