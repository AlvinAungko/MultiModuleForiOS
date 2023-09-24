//
//  UICollectionView+Extension.swift
//  Utilities
//
//  Created by Aung Ko Ko on 24/09/2023.
//

import Foundation
import UIKit

extension UICollectionView {
    
    public func registerCells(_ identifier: String ...) {
        identifier.forEach {
            self.register(UINib(nibName: $0, bundle: nil), forCellWithReuseIdentifier: $0)
        }
    }
    
}
