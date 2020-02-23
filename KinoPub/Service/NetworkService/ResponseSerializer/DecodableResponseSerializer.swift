//
//  DecodableResponseSerializer.swift
//  KinoPub
//
//  Created by Maksim Kolesnik on 18/02/2020.
//  Copyright © 2020 Maksim Kolesnik. All rights reserved.
//

import Foundation
import Moya

public struct DecodableResponseSerializer<T>: ResponseSerializer where T: Decodable {

    public func process(_ response: Moya.Response) throws -> T {
        return try JSONDecoder().decode(T.self, from: response.data)
    }

    public init() {}
}
