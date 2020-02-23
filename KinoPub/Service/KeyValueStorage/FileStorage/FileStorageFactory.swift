//
//  FileStorageFactory.swift
//  KinoPub
//
//  Created by Maksim Kolesnik on 05/03/2020.
//  Copyright © 2020 Maksim Kolesnik. All rights reserved.
//

import Foundation

public final class FileStorageFactory: KeyValueStorageFactory {
    lazy public var lazyKeyValueStorage: KeyValueStorage = {
        return FileStorage()
    }()
}
