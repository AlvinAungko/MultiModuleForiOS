//
//  BaseView.swift
//  UIComponent
//
//  Created by Aung Ko Ko on 24/09/2023.
//

import Foundation
import UIKit
import Utilities


open class BaseCustomView: UIView {
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadView()
        setupUI()
    }
    
    override open func awakeFromNib() {
        super.awakeFromNib()
        makeAnimation(duration: 1.5)
    }
    
    open override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    public func loadView() {
        let view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
    }
    
    open func setupUI() {
        
    }
    
    deinit {
        
    }
    
    open func makeAnimation(duration: TimeInterval) {
        UIView.animate(withDuration: duration) {
            self.layoutIfNeeded()
        }
    }
    
}
