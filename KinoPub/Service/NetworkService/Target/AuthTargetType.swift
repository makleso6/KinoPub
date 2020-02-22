//
//  AuthTargetType.swift
//  KinoPub
//
//  Created by Maksim Kolesnik on 22/02/2020.
//  Copyright © 2020 Maksim Kolesnik. All rights reserved.
//

import Moya

public protocol AuthTargetType: DecodingTargetType { }

extension AuthTargetType {
    public var url: URL? {
        URL(string: "https://api.service-kp.com/oauth2")
    }
}
