//
//  AccessToken.swift
//  KinoPub
//
//  Created by Maksim Kolesnik on 22/02/2020.
//  Copyright © 2020 Maksim Kolesnik. All rights reserved.
//

import Foundation

public struct AccessToken: Token {
    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case refreshToken = "refresh_token"
        case expressIn = "expires_in"
    }
    
    public let accessToken: String
    public let refreshToken: String
    public let expressIn: Int
}
