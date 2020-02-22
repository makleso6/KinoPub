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




class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    var dispose: Set<AnyCancellable> = .init()

    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        
        // Create the SwiftUI view that provides the window contents.
        //        let contentView = ContentView(viewModel: RepositoryDetailViewModel(networkService: MoyaNetworkService()))
        //        let authorizationView = AuthorizationView(viewModel: .init())
        // Use a UIHostingController as window root view controller.
        
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = _BookmarksViewController()//BookmarksModuleFactory().viewController//
            self.window = window
            window.makeKeyAndVisible()
        }
//
//            if DefaultAccessTokenService(keyValueStorage: KeyChainStorage()).accessToken != nil {
//                let viewModel = BookmarksViewModel()
//
//                let view = BookmarksView(viewModel: viewModel)
//                let vc = UIHostingController(rootView: view)
//                window.rootViewController = vc//UIHostingController(rootView: authorizationView)
//
//                viewModel.callBack
//                    .sink(receiveValue: { [weak vc, weak self] (bookmark) in
//                        guard let self = self else { return }
//                        let _model = BookmarkViewModel(model: bookmark)
//                        let _vc = UIHostingController(rootView: BookmarkView(viewModel: _model))
//                        vc?.present(_vc, animated: true, completion: nil)
//
//                        _model.callBack
//                            .sink(receiveValue: { [weak _vc] (item) in
//                                let __model = VideoItemViewModel(model: item)
//                                let __vc = UIHostingController(rootView: VideoItemView(viewModel: __model))
//                                _vc?.present(__vc, animated: true, completion: nil)
//                                __model.callBack
//                                    .sink(receiveValue: { [weak __vc] (season) in
//                                        let ___model = SeasonViewModel(season: season)
//                                        let ___vc = UIHostingController(rootView:  SeasonView(viewModel: ___model))
//                                        __vc?.present(___vc, animated: true, completion: nil)
//                                        ___model.callBack
//                                            .sink(receiveValue: { [weak ___vc] (episode) in
//                                                print(episode.files.count)
//                                                print(episode.files)
//
//                                                if let _720p = episode.files.first(where: { $0.quality == "720p" }),
//                                                    let hls = URL(string: _720p.url.hls4),
//                                                    let http = URL(string: _720p.url.http) {
//                                                    let item = AVPlayerItem(url: hls)
//                                                    let avPlayer = AVPlayer(playerItem: item)
//                                                    let avVC = AVPlayerViewController()
//                                                    avVC.player = avPlayer
//                                                    avVC.modalPresentationStyle = .none
//                                                    ___vc?.present(avVC, animated: true, completion: nil)
////                                                    if let path = 720p
////                                                    item.assetURL
//                                                }
//                                            })
//                                            .store(in: &self.dispose)
//                                    })
//                                    .store(in: &self.dispose)
//                            })
//                            .store(in: &self.dispose)
//                    })
//                    .store(in: &dispose)
//            } else {
                //UIHostingController(rootView: authorizationView)
//            }
//        }
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
    
    
}

