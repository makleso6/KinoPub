//
//  FileStorage.swift
//  KinoPub
//
//  Created by Maksim Kolesnik on 03/03/2020.
//  Copyright © 2020 Maksim Kolesnik. All rights reserved.
//

import Files
import Foundation

public final class FileStorage: KeyValueStorage {

    private let documentDirectoryPath: String
    private let folder: Folder
    public init(documentDirectoryPath: String = NSTemporaryDirectory()) {
        self.documentDirectoryPath = documentDirectoryPath
        do {
            self.folder = try Folder(path: documentDirectoryPath)
        } catch {
            self.folder = Folder.temporary
        }
    }

    public func object<Value>(for key: Key<Value>) -> Value? where Value: Decodable, Value: Encodable {
        do {
            let data = try folder.file(at: key.rawValue).read()
            return try JSONDecoder().decode(Value.self, from: data)
        } catch {
            print(error)
            return nil
        }
    }

    public func setObject<Value>(_ object: Value?, for key: Key<Value>) where Value: Decodable, Value: Encodable {
        do {
            let data = try JSONEncoder().encode(object)
            try folder.createFile(at: key.rawValue, contents: data)
        } catch {
            print(error)
        }
    }

    public func removeObject<Value>(for key: Key<Value>) where Value: Decodable, Value: Encodable {
        do {
            try folder.file(at: key.rawValue).delete()
        } catch {
            print(error)
        }
    }
}
