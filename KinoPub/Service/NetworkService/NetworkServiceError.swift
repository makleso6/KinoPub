//
//  NetworkServiceError.swift
//  KinoPub
//
//  Created by Maksim Kolesnik on 17/02/2020.
//  Copyright © 2020 Maksim Kolesnik. All rights reserved.
//

import Foundation

public enum NetworkServiceError: Swift.Error {
    case error(Error)
    case serializerError
    case invalidUrl
}
