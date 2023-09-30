//
//  UITableView+Extension.swift
//  Utilities
//
//  Created by Aung Ko Ko on 24/09/2023.
//

import Foundation
import UIKit
import ViewAnimator

extension UITableView {
    
    public func deque<cell: UITableViewCell>(_ cell: cell.Type) -> cell {
        return dequeueReusableCell(withIdentifier: cell.className) as! cell
    }
    
    public func registerCells(_ identifier: String ...) {
        identifier.forEach {
            self.register(UINib(nibName: $0, bundle: nil), forCellReuseIdentifier: $0)
        }
    }
    
    public func registerHeaderFooter(nib nibName: String, bundle: Bundle? = nil) {
        register(UINib(nibName: nibName , bundle: bundle), forHeaderFooterViewReuseIdentifier: nibName)
    }
    
    public func registerHeaderFooter<View: UITableViewHeaderFooterView>(view: View.Type) {
        register(View.self, forHeaderFooterViewReuseIdentifier: View.className)
    }
    
    public func dequeHeader<View: UITableViewHeaderFooterView>(_ view: View.Type) -> View? {
        return dequeueReusableHeaderFooterView(withIdentifier: View.className) as? View
    }
    
    func reloadData(animation: Bool) {
        if animation {
            self.reloadData()
            self.layoutIfNeeded()
            UIView.animate(views: self.visibleCells, animations: [AnimationType.from(direction: .bottom, offset: UIScreen.main.bounds.width / 2)], reversed: false, initialAlpha: 0, finalAlpha: 1, delay: 0, animationInterval: AniDuration.interval.double(), duration: AniDuration.duration.double(), usingSpringWithDamping: AniDuration.springWithDamping.float(), initialSpringVelocity: AniDuration.springVelocity.float(), options: [.curveEaseInOut], completion: nil)
        } else {
            self.reloadData()
        }
    }
}
