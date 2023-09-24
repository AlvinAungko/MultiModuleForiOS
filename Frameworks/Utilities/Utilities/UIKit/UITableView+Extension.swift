//
//  UITableView+Extension.swift
//  Utilities
//
//  Created by Aung Ko Ko on 24/09/2023.
//

import Foundation
import UIKit

extension UITableView {
    
    public func registerCells(_ identifier: String ...) {
        identifier.forEach {
            self.register(UINib(nibName: $0, bundle: nil), forCellReuseIdentifier: $0)
        }
    }
    
    public func registerHeaderFooter<View: UITableViewHeaderFooterView>(view: View.Type) {
        register(View.self, forHeaderFooterViewReuseIdentifier: View.className)
    }
    
    public func dequeHeader<View: UITableViewHeaderFooterView>(_ view: View.Type) -> View? {
        return dequeueReusableHeaderFooterView(withIdentifier: View.className) as? View
    }
}
