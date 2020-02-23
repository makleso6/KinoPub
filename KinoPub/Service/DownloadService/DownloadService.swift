//
//  DownloadService.swift
//  KinoPub
//
//  Created by Maksim Kolesnik on 04/03/2020.
//  Copyright © 2020 Maksim Kolesnik. All rights reserved.
//

import Alamofire
import Files
import Foundation

public protocol DownloadService: AnyObject {
    func download(url: URL, progress: @escaping (Progress) -> Void, completionHandler: @escaping (AFDownloadResponse<Data>) -> Void)
    func cancel(url: URL)
    func cancelAll()
}
