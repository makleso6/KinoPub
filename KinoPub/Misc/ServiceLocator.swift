//
//  ServiceLocator.swift
//  KinoPub
//
//  Created by Maksim Kolesnik on 22/02/2020.
//  Copyright © 2020 Maksim Kolesnik. All rights reserved.
//

import Foundation
import Combine

public final class ServiceLocator {
    public static let shared = ServiceLocator()

    public var keyChainStorage: KeyValueStorage {
        return KeyChainStorage()
    }

    public var fileStorage: KeyValueStorage {
        return FileStorageFactory().lazyKeyValueStorage
    }
}
