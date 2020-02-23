//
//  KeyChainStorage.swift
//  KinoPub
//
//  Created by Maksim Kolesnik on 18/02/2020.
//  Copyright © 2020 Maksim Kolesnik. All rights reserved.
//

import Foundation
import KeychainAccess

public protocol KeyChainStorageDependency {
    var keyChainStorage: KeyValueStorage { get }
}

public final class KeyChainStorage: KeyValueStorage {

    private lazy var keychain: Keychain = {
        return Keychain(service: "ru.kinopub")
    }()

    public func object<Value>(for key: Key<Value>) -> Value? where Value: Decodable, Value: Encodable {
        do {
            guard let data = try keychain.getData(key.rawValue) else { return nil }
            return try JSONDecoder().decode(Value.self, from: data)
        } catch {
            print(error)
            print(error)
            print(error)
            print(error)

            return nil
        }
    }

    public func setObject<Value>(_ object: Value?, for key: Key<Value>) where Value: Decodable, Value: Encodable {
        do {
            let data = try JSONEncoder().encode(object)
            try keychain.set(data, key: key.rawValue)
        } catch {
            print(error)
            print(error)
            print(error)
            print(error)
        }
    }

    public func removeObject<Value>(for key: Key<Value>) where Value: Decodable, Value: Encodable {
        do {
            try keychain.remove(key.rawValue)
        } catch {
            print(error)
            print(error)
            print(error)

        }
    }
}
