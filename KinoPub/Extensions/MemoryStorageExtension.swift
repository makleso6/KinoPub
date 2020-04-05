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
    public func setItems<Items>(forSection: Int = 0) -> AnySubscriber<Items, Never> where Items: Sequence {
        return AnySubscriber<Items, Never>(receiveSubscription: { (subscription) in
            subscription.request(.unlimited)
        }, receiveValue: { [weak self] (items) -> Subscribers.Demand in
            guard let self = self else { return .none }
            self.setItems(.init(items), forSection: forSection)
            return .unlimited
        }, receiveCompletion: { (_) in

        })
    }
    
    public func addItems<Items>(toSection: Int = 0) -> AnySubscriber<Items, Never> where Items: Sequence {
        return AnySubscriber<Items, Never>(receiveSubscription: { (subscription) in
            subscription.request(.unlimited)
        }, receiveValue: { [weak self] (items) -> Subscribers.Demand in
            guard let self = self else { return .none }
            self.addItems(.init(items), toSection: toSection)
            return .unlimited
        }, receiveCompletion: { (_) in

        })
    }
}
