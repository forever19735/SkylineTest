//
//  AppDelegate.swift
//  SkylineTest
//
//  Created by apple on 2018/7/20.
//  Copyright © 2018年 Johnny. All rights reserved.
//

import UIKit
import Kingfisher

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        ImageCache.default.maxMemoryCost = 1
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = TravelNavigationController()
        self.window?.makeKeyAndVisible()
        
        return true
    }
}
