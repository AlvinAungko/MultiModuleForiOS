//
//  CourseInfoView.swift
//  UIComponent
//
//  Created by Aung Ko Ko on 28/09/2023.
//

import UIKit

class CourseInfoView: BaseCustomView {
    
    @IBOutlet weak var mainCourseImage: UIImageView!
    @IBOutlet weak var mainCourseTitle: UILabel!
    @IBOutlet weak var courseDescriptionLabel: UILabel!
    @IBOutlet weak var videoCounterLabel: UILabel!
    @IBOutlet weak var videoDurationLabel: UILabel!
    @IBOutlet weak var starRatingLabel: UILabel!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func setupUI() {
        super.setupUI()
    }
    
}
