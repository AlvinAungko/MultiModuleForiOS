//
//  BaseCollectionViewCell.swift
//  UIComponent
//
//  Created by Aung Ko Ko on 24/09/2023.
//

import Foundation
import UIKit

open class BaseCollectionViewCell<T: Any>: UICollectionViewCell {
    
    var item: T? {
        didSet {
            if let item = item {
                self.bindData(item)
            }
        }
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    open override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    open func setupUI() {
        
    }
    
    open func bindData(_ data: T) {
        
    }
    
    deinit {
        debugPrint("This cell instance is now deallocated from Memory.")
    }
    
}
