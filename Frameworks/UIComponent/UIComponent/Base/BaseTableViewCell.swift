//
//  BaseTableViewCell.swift
//  UIComponent
//
//  Created by Aung Ko Ko on 24/09/2023.
//

import Foundation
import UIKit

open class BaseTableViewCell<T: Any>: UITableViewCell {
    
    open var item: T? {
        didSet {
            if let item = item {
                self.bindData(item)
            }
        }
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    open override  func awakeFromNib() {
        super.awakeFromNib()
        self.setupUI()
    }
    
    open override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    open override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    open func setupUI() {
        
    }
    
    open func bindData(_ item: T) {}
    
    deinit {
        debugPrint("This cell instance is now deallocated from Memory.")
    }
    
}

