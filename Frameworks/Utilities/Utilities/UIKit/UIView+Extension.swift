//
//  UIView+Extension.swift
//  Utilities
//
//  Created by Aung Ko Ko on 24/09/2023.
//

import Foundation
import UIKit

extension UIView {
    
    public func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: self.className, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
}
