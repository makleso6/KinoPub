//
//  SceneDelegate.swift
//  KinoPub
//
//  Created by Maksim Kolesnik on 13/02/2020.
//  Copyright © 2020 Maksim Kolesnik. All rights reserved.
//

import UIKit
import SwiftUI
import Combine
import AVKit

internal final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    internal var window: UIWindow?
    internal var dispose: Set<AnyCancellable> = .init()

    internal func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).

        // Create the SwiftUI view that provides the window contents.
        //        let contentView = ContentView(viewModel: RepositoryDetailViewModel(networkService: MoyaNetworkService()))
        //        let authorizationView = AuthorizationView(viewModel: .init())
        // Use a UIHostingController as window root view controller.

        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            let factory =  BookmarksFactory()
            window.rootViewController = UINavigationController(rootViewController: factory.instantiateModuleTransitionHandler())
            self.window = window
            window.makeKeyAndVisible()
        }
    }

}
