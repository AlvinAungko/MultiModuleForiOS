//
//  AppDelegate.swift
//  MultiModuleRefactor
//
//  Created by Aung Ko Ko on 23/09/2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        setUpRootController()
        return true
    }
    
    func setUpRootController() {
        let controller = CustomTabBarController()
        let nav = UINavigationController(rootViewController: controller)
        window?.rootViewController = nav
    }
    
}

