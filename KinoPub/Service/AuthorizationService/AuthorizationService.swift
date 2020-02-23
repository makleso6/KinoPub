//
//  AuthorizationService.swift
//  KinoPub
//
//  Created by Maksim Kolesnik on 22/02/2020.
//  Copyright © 2020 Maksim Kolesnik. All rights reserved.
//

import Combine

public protocol AuthorizationService {
    func getDevice() -> AnyPublisher<DeviceCodeResponse, Error>
    func getToken(_ response: DeviceCodeResponse) -> AnyPublisher<AccessToken, Error>
    func refreshAccessToken(_ accessToken: AccessToken) -> AnyPublisher<AccessToken, Error>
}
