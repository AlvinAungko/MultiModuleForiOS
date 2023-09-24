//
//  HomeNetworkConfiguration.swift
//  MultiModuleRefactor
//
//  Created by Aung Ko Ko on 24/09/2023.
//

import Foundation
import Networking

enum HomeNetworkConfiguration {
    case listOfStudents
}

extension HomeNetworkConfiguration: Configuration {
    
    var baseURL: String {
        return Constants.baseUrl
    }
    
    var path: String {
        return "api/students"
    }
    
    var method: Networking.HTTPMethod {
        return .get
    }
    
    var task: Networking.Task {
        return .requestPlain
    }
    
    var headers: [String : String]? {
        return [:]
    }
    
    var data: Data? {
        return nil
    }
    
    
}
