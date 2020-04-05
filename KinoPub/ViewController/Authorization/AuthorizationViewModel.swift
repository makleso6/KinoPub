//
//  AuthorizationViewModel.swift
//  KinoPub
//
//  Created by Maksim Kolesnik on 22/02/2020.
//  Copyright © 2020 Maksim Kolesnik. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

public final class AuthorizationViewModel: ObservableObject {
    @Published public var code: String = "CODE"
    public var callBack = PassthroughSubject<Bool, Never>()
    private var disposables = Set<AnyCancellable>()

    private let accessTokenService: AccessTokenService
    private let authorizationService: AuthorizationService

    public init(accessTokenService: AccessTokenService,
                authorizationService: AuthorizationService) {
        self.accessTokenService = accessTokenService
        self.authorizationService = authorizationService

        let pub = authorizationService.getDevice()

        pub.map({ $0.userCode })
            .handleEvents(receiveOutput: { (code) in
                print("CODE: ", code)
            })
            .catch({ (_) -> Empty<String, Never> in
                return .init()
            })
            .assign(to: \.code, on: self)
            .store(in: &disposables)

        pub
            .catch({ (_) -> Empty<DeviceCodeResponse, Never> in
                return .init()
            })
            .flatMap({  (resp) -> AnyPublisher<DeviceCodeResponse, Never> in
                Just(resp).eraseToAnyPublisher()
            })
            .flatMap({ [weak self] (response: DeviceCodeResponse) -> AnyPublisher<AccessToken, Never> in
                guard let self = self else { return Empty().eraseToAnyPublisher() }
                print(response.userCode)
                return self.authorizationService.getToken(response)
                    .catch({ _ in Empty() })
                    .eraseToAnyPublisher()
            })
            .handleEvents(receiveOutput: { [weak self] token in
                self?.accessTokenService.set(token: token)
            })
            .map({ _ in true })
            .subscribe(callBack)
            .store(in: &disposables)
    }

    public func action() {
        guard let url = URL(string: "https://kino.pub/device?code=\(code)") else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)

    }
}
