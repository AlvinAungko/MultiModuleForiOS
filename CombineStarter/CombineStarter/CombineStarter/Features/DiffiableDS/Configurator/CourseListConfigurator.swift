//
//  CourseListConfigurator.swift
//  CombineStarter
//
//  Created by Aung Ko Ko on 29/09/2023.
//

import Foundation
import Networking

enum CourseListConfigurator {
    case courseList
}

extension CourseListConfigurator: Configuration {
    var baseURL: String {
        return ""
    }
    
    var path: String {
        return ""
    }
    
    var method: Networking.HTTPMethod {
        return .get
    }
    
    var task: Networking.Task {
        return .requestPlain
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    var data: Data? {
        return nil
    }
    
    
}
