//
//  DefaultAccessTokenServiceFactory.swift
//  KinoPub
//
//  Created by Maksim Kolesnik on 22/02/2020.
//  Copyright © 2020 Maksim Kolesnik. All rights reserved.
//

import Foundation

public final class DefaultAccessTokenServiceFactory: AccessTokenServiceFactory {
    
    private let keyValueStorage: KeyValueStorage
    
    public var accessTokenService: AccessTokenService {
        DefaultAccessTokenService(keyValueStorage: keyValueStorage)
    }
    
    public init(keyValueStorage: KeyValueStorage) {
        self.keyValueStorage = keyValueStorage
    }
}
