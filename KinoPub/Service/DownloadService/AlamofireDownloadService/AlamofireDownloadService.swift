//
//  AlamofireDownloadService.swift
//  KinoPub
//
//  Created by Maksim Kolesnik on 06/03/2020.
//  Copyright © 2020 Maksim Kolesnik. All rights reserved.
//

import Alamofire
import Files
import Foundation

extension Key where Value == Data {
    public static func file(_ path: String) -> Key { .init(rawValue: path) }
}

public final class AlamofireDownloadService {
    private var map: [String: DownloadRequest] = [:]
    private let fileStorage: KeyValueStorageFactory
    public init(fileStorage: KeyValueStorageFactory) {
        self.fileStorage = fileStorage
    }

}

extension AlamofireDownloadService: DownloadService {

    public func download(url: URL, progress: @escaping (Progress) -> Void, completionHandler: @escaping (AFDownloadResponse<Data>) -> Void) {
        let lastPathComponent = url.lastPathComponent
        let path = lastPathComponent
        let destination: DownloadRequest.Destination = { (url, resp) -> (URL, DownloadRequest.Options) in
            let documentDirectoryPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first ?? NSTemporaryDirectory()
            let documentDirectoryUrl = URL(fileURLWithPath: documentDirectoryPath).appendingPathComponent(lastPathComponent)
            return (documentDirectoryUrl, .createIntermediateDirectories)
        }
        let request: DownloadRequest = {
            if let data = fileStorage.lazyKeyValueStorage.object(for: .file(path)) {
                return Session.default.download(resumingWith: data, to: destination)
            } else {
                return Session.default.download(url, to: destination)
            }
        }()

        map[path] = request
            .downloadProgress(closure: progress)
            .responseData(completionHandler: { [weak self] response in
                self?.map.removeValue(forKey: path)
                completionHandler(response)
            })

    }

    private func cancel(path: String) {
        map[path]?.cancel(byProducingResumeData: { [weak self] (data) in
            self?.fileStorage.lazyKeyValueStorage.setObject(data, for: .file(path))
        })
    }

    public func cancel(url: URL) {
        cancel(path: url.lastPathComponent)
    }

    public func cancelAll() {
        map.forEach({ cancel(path: $0.key) })
    }
}
