//
//  CustomTabBarController.swift
//  MultiModuleRefactor
//
//  Created by Aung Ko Ko on 27/09/2023.
//

import UIKit
import Utilities

class CustomTabBarController: UITabBarController {
    
    var homeView: UIViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        delegate = self
    }
    
    private func setupView() {
        let memberType = HomeTabBarItem(type: .Member)
        let homeVC = HomeViewController()
        homeVC.tabBarItem = memberType
        self.homeView = homeVC
        viewControllers = [
            self.homeView
        ]
    }
    
    private func generateTabBar() {
        viewControllers = [
            generateVC(viewController: HomeViewController(), title: "Home", image: nil, selectedImage: nil)
        ]
    }
    
    private func generateVC(viewController: UIViewController, title: String, image: UIImage?, selectedImage: UIImage?) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        viewController.tabBarItem.selectedImage = selectedImage
        return viewController
    }
    
    private func setTabBarAppearance() {
        let positionOnX: CGFloat = 0
        let positionOnY: CGFloat = 10
        let width = tabBar.bounds.width - positionOnX * 2
        let height = tabBar.bounds.height + positionOnY * 5
        
        let roundLayer = CAShapeLayer()
        
        let bezierPath = UIBezierPath(
            roundedRect: CGRect(
                x: positionOnX,
                y: tabBar.bounds.minY - positionOnY,
                width: width,
                height: height
            ),
            cornerRadius: height / 3.5
        )
        
        roundLayer.path = bezierPath.cgPath
        
        tabBar.layer.insertSublayer(roundLayer, at: 0)
        tabBar.itemWidth = width / 5
        tabBar.itemPositioning = .centered
        tabBar.tintColor = UIColor.clear
        roundLayer.fillColor = UIColor.white.cgColor
        roundLayer.addShadow()
        
        if #available(iOS 13, *) {
            let appearance = UITabBarAppearance()
            appearance.stackedLayoutAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.clear]
            appearance.stackedLayoutAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.blue]
            self.tabBar.standardAppearance = appearance
        } else {
            // For normal state, the color is clear color, so you will not see any title until your tab is selected.
            UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.clear], for: .normal)
            // Set any color for selected state
            UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.blue], for: .selected)
        }
    }
}


