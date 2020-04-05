//
//  AppDelegate.swift
//  KinoPub
//
//  Created by Maksim Kolesnik on 13/02/2020.
//  Copyright © 2020 Maksim Kolesnik. All rights reserved.
//

import UIKit
import Combine

@UIApplicationMain
internal final class AppDelegate: UIResponder, UIApplicationDelegate, UISplitViewControllerDelegate {
    
    internal var window: UIWindow?
    internal var authorizationService: AuthorizationService?
    internal var cancelable: Set<AnyCancellable> = .init()
    internal func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let accessTokenService = DefaultAccessTokenServiceFactory(keyValueStorage: KeyChainStorageFactory())
        accessTokenService.lazyAccessTokenService.set(token: AccessToken(accessToken: "",
                                                                         refreshToken: "",
                                                                         expressIn: 0))
        let networkService = MoyaNetworkServiceFactory(accessTokenService: accessTokenService)
        let authorizationService = DefaultAuthorizationServiceFactory(networkService: networkService,
                                                                      accessTokenService: accessTokenService)
            .lazyAuthorizationService
        self.authorizationService = authorizationService
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        let loadingViewController = LoadingViewController()
        window.rootViewController = loadingViewController
        self.window = window
        window.makeKeyAndVisible()

//        authorizationService.getDevice()
//            .flatMap({
//                 authorizationService.getToken($0)
//            }).sink(receiveCompletion: { (completion) in
//                print(#file, "completion", completion)
//            }, receiveValue: { (token) in
//                print(#file, "token", token)
//            })
//            .store(in: &cancelable)
        
        authorizationService.refreshAccessToken()
            .sink(receiveCompletion: { (compeltion) in
                switch compeltion {
                case .failure(let error):
                    print(error)
                    let auth = AuthorizationModuleFactory().viewController
                    loadingViewController.present(auth, animated: true, completion: nil)
                case .finished:
                    print("finished")
                }
            }, receiveValue: { (token) in
                print(token)
                let factory = BookmarksFactory()
                window.rootViewController = UINavigationController(rootViewController: factory.instantiateModuleTransitionHandler())
                
            })
            .store(in: &cancelable)
        
        return true
    }

}

public final class LoadingViewController: UIViewController {
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.baseBackgroung
    }
}
