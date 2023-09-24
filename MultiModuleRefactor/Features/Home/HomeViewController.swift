//
//  HomeViewController.swift
//  MultiModuleRefactor
//
//  Created by Aung Ko Ko on 23/09/2023.
//

import UIKit
import UIComponent

class HomeViewController: BaseViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setupUI() {
        super.setupUI()
        titleLabel.text = "Fly"
    }
}
