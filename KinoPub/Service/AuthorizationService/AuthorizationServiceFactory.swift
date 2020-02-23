//
//  AuthorizationServiceFactory.swift
//  KinoPub
//
//  Created by Maksim Kolesnik on 22/02/2020.
//  Copyright © 2020 Maksim Kolesnik. All rights reserved.
//

import Foundation

public protocol AuthorizationServiceFactory {
    var lazyAuthorizationService: AuthorizationService { get }
}
