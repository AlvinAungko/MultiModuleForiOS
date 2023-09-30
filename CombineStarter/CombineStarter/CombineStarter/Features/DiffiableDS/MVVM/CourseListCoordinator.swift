//
//  CourseListCoordinator.swift
//  CombineStarter
//
//  Created by Aung Ko Ko on 29/09/2023.
//

import Foundation
import UIKit

class CourseListCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator]?
    
    weak var navigationController: UINavigationController?
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = CourseListViewController()
        self.navigationController?.viewControllers = [vc]
    }
}

extension CourseListCoordinator: CourseListNavigationDelagate {
    func routeToDetailPage() {
        
    }
}

extension CourseListCoordinator: CourseListPopBackDelegate {
    func routeBackToCourseList() {
        
    }
}
