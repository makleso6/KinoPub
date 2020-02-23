//
//  ItemRequest.swift
//  KinoPub
//
//  Created by Maksim Kolesnik on 07/03/2020.
//  Copyright © 2020 Maksim Kolesnik. All rights reserved.
//

import Moya

public struct ItemRequest: ApiTargetType {
    public var serializer: DecodableResponseSerializer<ItemResponse> { .init() }
    public var path: String { "items/\(id)" }
    public var method: Moya.Method { .get }
    public var task: Moya.Task { .requestPlain }
    public let id: Int
    public init(id: Int) {
        self.id = id
    }
}

public struct ItemResponse: Codable {
    public let status: Int
    public let item: Item
}
