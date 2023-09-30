//
//  DataSource.swift
//  CombineStarter
//
//  Created by Aung Ko Ko on 29/09/2023.
//

import Foundation
import UIKit

// conforms to UITableViewDataSource
class DataSource: UITableViewDiffableDataSource<CourseHeader, Course> {
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if CourseHeader.allCases[section] == .mainCourse {
            return "🛒" + CourseHeader.allCases[section].rawValue
        } else {
            return CourseHeader.allCases[section].rawValue // "Running"
        }
    }
}
