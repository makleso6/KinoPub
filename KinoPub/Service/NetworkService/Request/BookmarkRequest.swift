//
//  BookmarkRequest.swift
//  KinoPub
//
//  Created by Maksim Kolesnik on 07/03/2020.
//  Copyright © 2020 Maksim Kolesnik. All rights reserved.
//

import Moya

public struct BookmarkRequest: ApiTargetType {
    public var serializer: DecodableResponseSerializer<BookmarkResponse> { .init() }
    public var path: String { "bookmarks/\(id)" }
    public var method: Moya.Method { .get }
    public var task: Moya.Task {
        .requestParameters(parameters: ["page": page], encoding: URLEncoding())
    }
    public let id: Int
    public let page: Int
    public init(id: Int,
                page: Int) {
        self.id = id
        self.page = page
    }
}

public struct BookmarkResponse: Codable {
    public let status: Int
    public let folder: Directory
    public let items: [Bookmark.Item]
    public let pagination: Pagination
}
