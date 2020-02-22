//
//  AccessTokenService.swift
//  KinoPub
//
//  Created by Maksim Kolesnik on 22/02/2020.
//  Copyright © 2020 Maksim Kolesnik. All rights reserved.
//

import Foundation

public protocol Token: Codable {
    var accessToken: String { get }
    var refreshToken: String { get }
    var expressIn: Int { get }
}

public protocol AccessTokenService {
    func set<T>(token: T) where T: Token
    func token<T>() -> T? where T: Token
}
