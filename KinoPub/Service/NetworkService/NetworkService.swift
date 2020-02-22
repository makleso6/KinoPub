//
//  NetworkService.swift
//  KinoPub
//
//  Created by Maksim Kolesnik on 17/02/2020.
//  Copyright © 2020 Maksim Kolesnik. All rights reserved.
//

import Foundation
import Moya
import Combine

public protocol NetworkService: AnyObject {
    @discardableResult
    func execute<R>(_ request: R,
                    callbackQueue: DispatchQueue?,
                    progress: ProgressBlock?,
                    completion: @escaping (Result<R.ResponseSerializerType.EntityType, Error>) -> Void) -> Moya.Cancellable where R: DecodingTargetType
}

public protocol CombineNetworkService: NetworkService {
    func execute<R>(_ request: R) -> AnyPublisher<R.ResponseSerializerType.EntityType, Error>  where R: DecodingTargetType
}
