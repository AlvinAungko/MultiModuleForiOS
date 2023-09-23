//
//  HomeViewController.swift
//  MultiModuleRefactor
//
//  Created by Aung Ko Ko on 23/09/2023.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = "Multi Module Architecture"
    }
}
