//
//  CourseListDataManager.swift
//  CombineStarter
//
//  Created by Aung Ko Ko on 29/09/2023.
//

import Foundation
import Networking
import Combine

class CourseListDataManager {
    func fetchList() -> AnyPublisher<[Course], ServiceError>  {
        return CombineNetworkManager.shared.fetchData(configuration: CourseListConfigurator.courseList, responseType: [Course].self)
    }
}
