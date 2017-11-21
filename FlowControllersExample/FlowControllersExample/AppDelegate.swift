//
//  AppDelegate.swift
//  FlowControllersExample
//
//  Created by Yani Buchkov on 11/21/17.
//  Copyright © 2017 Mr Bouchkov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        setupCoordinator()
        return true
    }
    
    func setupCoordinator() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController()
        appCoordinator = AppCoordinator(withNavigationController: window?.rootViewController as! UINavigationController)
        appCoordinator?.start()
        window?.makeKeyAndVisible()
    }
    

}

