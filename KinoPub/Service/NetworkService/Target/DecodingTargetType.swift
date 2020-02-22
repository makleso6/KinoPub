//
//  DecodingTargetType.swift
//  KinoPub
//
//  Created by Maksim Kolesnik on 17/02/2020.
//  Copyright © 2020 Maksim Kolesnik. All rights reserved.
//

import Foundation

public protocol DecodingTargetType: NetworkRequestType {
    associatedtype ResponseSerializerType: ResponseSerializer
    var serializer: ResponseSerializerType { get }
}
