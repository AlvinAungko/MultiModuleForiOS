//
//  CourseDetailTableViewCell.swift
//  CombineStarter
//
//  Created by Aung Ko Ko on 29/09/2023.
//

import UIKit
import UIComponent
import Utilities
import SkeletonView

class CourseDetailTableViewCell: BaseTableViewCell<Course> {

    @IBOutlet weak var courseTitle: UILabel!
    @IBOutlet weak var courseDescription: UILabel!
    @IBOutlet weak var courseImage: UILabel!
    
    override func setupUI() {
        super.setupUI()
    }
    
    override func bindData(_ item: Course) {
        super.bindData(item)
    }
    
}
