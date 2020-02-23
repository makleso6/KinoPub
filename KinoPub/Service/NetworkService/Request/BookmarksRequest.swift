//
//  BookmarksRequest.swift
//  KinoPub
//
//  Created by Maksim Kolesnik on 22/02/2020.
//  Copyright © 2020 Maksim Kolesnik. All rights reserved.
//

import Moya

public struct BookmarksRequest: ApiTargetType {
    public var serializer: DecodableResponseSerializer<BookmarksResponse> { .init() }
    public var path: String { "bookmarks" }
    public var method: Moya.Method { .get }
    public var task: Moya.Task { .requestPlain }
}

public struct BookmarksResponse: Codable {
    public let status: Int
    public let items: [Bookmark]
}
