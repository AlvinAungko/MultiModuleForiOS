//
//  TabBarItem.swift
//  MultiModuleRefactor
//
//  Created by Aung Ko Ko on 27/09/2023.
//

import Foundation
import UIKit
import UIComponent

public enum TabBarType {
    case Member
    case Explore
    case Booking
    case Wallet
    case More
}

class HomeTabBarItem: UITabBarItem {
    var tabBarType: TabBarType = .Member
    
    override init() {
        super.init()
    }
    
    convenience init(type: TabBarType) {
        self.init()
        guard let imgNormal = getTabBarImage(by: type, isActive: false) else { return }
        guard let imgSelected = getTabBarImage(by: type, isActive: true) else { return }
        
        self.tabBarType = type
        self.image = imgNormal
        self.selectedImage = imgSelected
        itemPositionAdjustment()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        itemPositionAdjustment()
    }
    
    fileprivate func getTabBarImage(by type: TabBarType, isActive: Bool) -> UIImage? {
        switch type {
        case .Member:
            self.title = "Member"
            return UIImage(named: isActive ? "icoTabbarHomeSelected" : "icoTabbarHomeNormal")
        case .Explore:
            return UIImage(named: isActive ? "icoTabbarExploreSelected" : "icoTabbarExploreNormal")
        case .Booking:
            return UIImage(named: isActive ? "icoTabbarBookSelected" : "icoTabbarBookNormal")
        case .Wallet:
            return UIImage(named: isActive ? "icoTabbarWalletSelected" : "icoTabbarWalletNormal")
        case .More:
            return UIImage(named: isActive ? "icoTabbarAccountSelected" : "icoTabbarAccountNormal")
        }
    }
    
    fileprivate func itemPositionAdjustment() {
        titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 0)
        imageInsets = UIEdgeInsets(top: 0, left: -4, bottom: 0, right: 4)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

