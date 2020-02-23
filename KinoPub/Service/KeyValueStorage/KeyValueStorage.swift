//
//  KeyValueStorage.swift
//  KinoPub
//
//  Created by Maksim Kolesnik on 18/02/2020.
//  Copyright © 2020 Maksim Kolesnik. All rights reserved.
//

import Foundation

public protocol KeyRepresentable {
    var rawValue: String { get }
}

public struct Key<Value>: KeyRepresentable {
    public let rawValue: String
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}

public protocol KeyValueStorage {
    func object<Value>(for key: Key<Value>) -> Value? where Value: Codable
    func setObject<Value>(_ object: Value?, for key: Key<Value>) where Value: Codable
    func removeObject<Value>(for key: Key<Value>) where Value: Codable
}
