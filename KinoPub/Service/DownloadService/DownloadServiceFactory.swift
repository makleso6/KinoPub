//
//  DownloadServiceFactory.swift
//  KinoPub
//
//  Created by Maksim Kolesnik on 06/03/2020.
//  Copyright © 2020 Maksim Kolesnik. All rights reserved.
//

import Foundation

public protocol DownloadServiceFactory: AnyObject {
    var lazyDownloadService: DownloadService { get }
}
