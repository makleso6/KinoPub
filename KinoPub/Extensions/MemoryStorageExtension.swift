//
//  MemoryStorageExtension.swift
//  KinoPub
//
//  Created by Maksim Kolesnik on 06/03/2020.
//  Copyright © 2020 Maksim Kolesnik. All rights reserved.
//

import DTModelStorage
import Combine

extension MemoryStorage {
    public func recive<Items>() -> AnySubscriber<Items, Never> where Items: Sequence {
        return AnySubscriber<Items, Never>(receiveSubscription: { (subscription) in
            subscription.request(.unlimited)
        }, receiveValue: { [weak self] (items) -> Subscribers.Demand in
            guard let self = self else { return .none }
            self.setItems(.init(items), forSection: 0)//addItems(.init(items))
            return .unlimited
        }, receiveCompletion: { (_) in

        })
    }
}
