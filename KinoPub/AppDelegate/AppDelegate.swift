//
//  AppDelegate.swift
//  KinoPub
//
//  Created by Maksim Kolesnik on 13/02/2020.
//  Copyright © 2020 Maksim Kolesnik. All rights reserved.
//

import UIKit
import Moya
import Alamofire
import Combine

@UIApplicationMain
internal final class AppDelegate: UIResponder, UIApplicationDelegate {

    internal func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
    }

    // MARK: UISceneSession Lifecycle

    internal func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    internal func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }

}
