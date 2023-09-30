//
//  CustomTabBar+Delegate.swift
//  MultiModuleRefactor
//
//  Created by Aung Ko Ko on 27/09/2023.
//

import Foundation
import UIKit

extension CustomTabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true
    }
}
