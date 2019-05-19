//
//  AppDelegate.swift
//  uberHackTeam4App
//
//  Created by Atila Costa on 18/05/19.
//  Copyright © 2019 Atila Costa. All rights reserved.
//

import UIKit
import GoogleMaps

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        AppProvider.shared.prepare()
        
        return true
    }

}

