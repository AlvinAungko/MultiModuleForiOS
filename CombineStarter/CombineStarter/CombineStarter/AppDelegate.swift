//
//  AppDelegate.swift
//  CombineStarter
//
//  Created by Aung Ko Ko on 26/09/2023.
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
        window?.rootViewController =  UINavigationController()
        let courseListCoordinator = CourseListCoordinator(navigationController: window?.rootViewController as! UINavigationController)
        courseListCoordinator.start()
    }
    
}

