//
//  AppDelegate.swift
//  TestRecruitment
//
//  Created by Kelvin on 14/03/23.
//

import UIKit
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var initialVC: UIViewController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // Keyboard management
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.previousNextDisplayMode = .alwaysHide
        
        if Pref.getString(KeyDefaults.userName) != "" {
            let home = StoryboardScene.Home.homeVC.instantiate()
            initialVC = UINavigationController.init(rootViewController: home)
        } else {
            let login = StoryboardScene.Login.loginVC.instantiate()
            initialVC = UINavigationController.init(rootViewController: login)
        }
        
        self.window?.rootViewController = initialVC
        self.window?.makeKeyAndVisible()
        
        return true
    }
}

