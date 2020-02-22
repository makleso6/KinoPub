//
//  ResponseSerializer.swift
//  KinoPub
//
//  Created by Maksim Kolesnik on 17/02/2020.
//  Copyright © 2020 Maksim Kolesnik. All rights reserved.
//

import Foundation
import Moya

public protocol ResponseSerializer {
    associatedtype EntityType
    func process(_ response: Moya.Response) throws -> EntityType
}
