//
//  Publisher+Bind.swift
//  KinoPub
//
//  Created by Maksim Kolesnik on 12/03/2020.
//  Copyright © 2020 Maksim Kolesnik. All rights reserved.
//

import Foundation
import Combine

public typealias Binding = Subscriber

public extension Publisher where Failure == Never {
    func bind<B: Binding>(subscriber: B) -> AnyCancellable
        where B.Failure == Never, B.Input == Output {

            handleEvents(receiveSubscription: { subscription in
                subscriber.receive(subscription: subscription)
            })
                .sink { value in
                    _ = subscriber.receive(value)
                }
    }
}
