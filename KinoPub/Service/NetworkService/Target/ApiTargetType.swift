//
//  ApiTargetType.swift
//  KinoPub
//
//  Created by Maksim Kolesnik on 22/02/2020.
//  Copyright © 2020 Maksim Kolesnik. All rights reserved.
//

import Moya
import Foundation

public protocol ApiTargetType: DecodingTargetType { }

extension ApiTargetType {
    public var url: URL? {
        URL(string: "https://api.service-kp.com/v1")
    }

    public var authorizationType: AuthorizationType? {
        .bearer
    }

    public var validationType: Moya.ValidationType {
        .successCodes
    }
}
