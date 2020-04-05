//
//  AnyCancelableMoyaWrapper.swift
//  KinoPub
//
//  Created by Maksim Kolesnik on 05/04/2020.
//  Copyright © 2020 Maksim Kolesnik. All rights reserved.
//

import Foundation
import Combine
import Moya

public final class AnyCancelableMoyaWrapper: Moya.Cancellable {
    public var isCancelled: Bool = false
    private let anyCancelable: AnyCancellable
    public init(anyCancelable: AnyCancellable) {
        self.anyCancelable = anyCancelable
    }
    public func cancel() {
        isCancelled = true
    }
}
