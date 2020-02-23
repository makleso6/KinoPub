//
//  EmptyResponseSerializer.swift
//  KinoPub
//
//  Created by Maksim Kolesnik on 13/03/2020.
//  Copyright © 2020 Maksim Kolesnik. All rights reserved.
//

import Foundation
import Moya

public struct EmptyResponseSerializer: ResponseSerializer {
    public func process(_ response: Moya.Response) throws -> Moya.Response {
        return response
    }
    public init() {}

}
