//
//  EpisodeViewModel.swift
//  KinoPub
//
//  Created by Maksim Kolesnik on 09/03/2020.
//  Copyright © 2020 Maksim Kolesnik. All rights reserved.
//

import Foundation
import Combine

public final class EpisodeViewModel {
    public enum State {
        case startDownload
        case pending
        case downloading
        case downloaded
    }
    public let state: State
    public let model: Episode
    public let downloadAction: (EpisodeViewModel) -> AnyPublisher<Progress, Error>
    public let cancelAction: (EpisodeViewModel) -> Void

    public init(model: Episode,
                state: State,
                downloadAction: @escaping (EpisodeViewModel) -> AnyPublisher<Progress, Error>,
                cancelAction: @escaping(EpisodeViewModel) -> Void) {
        self.model = model
        self.state = state
        self.downloadAction = downloadAction
        self.cancelAction = cancelAction
    }

    public func download() -> AnyPublisher<Progress, Error> {
        return downloadAction(self)
    }

    public func cancel() {
        return cancelAction(self)
    }
}
