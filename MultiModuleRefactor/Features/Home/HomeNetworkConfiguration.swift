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
        return ["Authorization": "Bearer 601af65b173b5c45a21bda5f2bdf1970ac955ff6eca0209fab31fa059cb1955dadf49903c285c8e1e5d932feef3726ece60bce1fa144167060b118754a46ca6dc570d56c3b44ba18786f68f910dc9682f1ad14f21d59a24136d8d35faa7845cd15e9caa7729026d126bb85b594efd7ab9995c0ba68b7fbbe61bf86473d611990"]
    }
    
    var data: Data? {
        return nil
    }
    
    
}
