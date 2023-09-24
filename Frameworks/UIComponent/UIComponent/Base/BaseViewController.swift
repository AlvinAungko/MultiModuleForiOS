//
//  BaseViewController.swift
//  UIComponent
//
//  Created by Aung Ko Ko on 24/09/2023.
//

import Foundation
import UIKit

open class BaseViewController: UIViewController {
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    public required  init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    open override func viewWillAppear(_ animated: Bool) {
       
    }
    
    open func setupUI() {}
    
}
