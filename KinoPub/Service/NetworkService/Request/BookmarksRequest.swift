//
//  BookmarksRequest.swift
//  KinoPub
//
//  Created by Maksim Kolesnik on 22/02/2020.
//  Copyright © 2020 Maksim Kolesnik. All rights reserved.
//

import Moya

struct BookmarksRequest: ApiTargetType {
    var serializer: DecodableResponseSerializer<BookmarksResponse> { .init() }
    var path: String { "bookmarks" }
    var method: Moya.Method { .get }
    var task: Moya.Task { .requestPlain }
}

struct BookmarksResponse: Codable {
    let status: Int
    let items: [Bookmark]
}
