//
//  DataResponseSerializer.swift
//  KinoPub
//
//  Created by Maksim Kolesnik on 17/02/2020.
//  Copyright © 2020 Maksim Kolesnik. All rights reserved.
//

import Foundation
import Moya

public struct DataResponseSerializer: ResponseSerializer {
    
    public func process(_ response: Moya.Response) throws -> Data {
        return response.data
    }

    public init() {}
}
