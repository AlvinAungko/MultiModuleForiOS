//
//  BaseCoordinator.swift
//  CombineStarter
//
//  Created by Aung Ko Ko on 29/09/2023.
//

import Foundation
import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator]? { get set }
    init(navigationController: UINavigationController)
    func start()
}
