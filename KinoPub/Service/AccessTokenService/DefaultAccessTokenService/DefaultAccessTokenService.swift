//
//  DefaultAccessTokenService.swift
//  KinoPub
//
//  Created by Maksim Kolesnik on 22/02/2020.
//  Copyright © 2020 Maksim Kolesnik. All rights reserved.
//

import Foundation

public extension Key where Value: Token {
    static var token: Key { .init(rawValue: "ru.kinopub.token") }
}

public final class DefaultAccessTokenService: AccessTokenService {

    private let keyValueStorage: KeyValueStorage
    public init(keyValueStorage: KeyValueStorage) {
        self.keyValueStorage = keyValueStorage
    }

    public func set<T>(token: T) where T: Token {
        self.keyValueStorage.setObject(token, for: .token)
    }

    public func token<T>() -> T? where T: Token {
        keyValueStorage.object(for: .token)
    }

}
