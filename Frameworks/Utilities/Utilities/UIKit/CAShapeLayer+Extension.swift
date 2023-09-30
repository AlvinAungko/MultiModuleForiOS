//
//  CAShapeLayer+Extension.swift
//  Utilities
//
//  Created by Aung Ko Ko on 27/09/2023.
//

import Foundation
import UIKit

extension CAShapeLayer {
    public func addShadow() {
        shadowColor = UIColor.lightGray.cgColor
        shadowOffset = .zero
        shadowOpacity = 0.5
        shadowRadius = 7
    }
}
