//
//  NetworkHelper.swift
//  Networking
//
//  Created by Aung Ko Ko on 29/09/2023.
//

import Foundation
import Alamofire

class NetworkHelper {
    static let shared = NetworkHelper()
    
    private init() {}
    
    func generateRequest(url: URL, method: String, headers: [String: String]?) -> NSMutableURLRequest {
        let request = NSMutableURLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 30.0)
        request.httpMethod = method
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        //        request.setValue("Bearer 35d715a8897b1c23d077afc0ba2dd4001e6289ff4fc405d151eeb2bb0016a892d43ce810b7f9b7aa42b50f1e9ece0db01e5c7ca5093203ed476afe5a57554d5bb30bccca7b4ab0656657f444465327b4326c0c9da13010e33be3ccf0226188a6eccfccfa688001634c14d4862ca496c5ea1cef72943143685fc8a104854c308b", forHTTPHeaderField: "Authorization")
        request.httpBody = nil
        
        for (key, value) in headers ?? [:] {
            request.setValue(value, forHTTPHeaderField: key)
        }
        
        return request
    }
    
    func generateParams(task: Task) -> ([String: Any], ParameterEncoding) {
        switch task {
        case .requestPlain:
            return ([:], URLEncoding.default)
        case let .requestParameters(parameters, encoding):
            return (parameters, encoding)
        }
    }
    
    func isSuccess(_ code: Int) -> Bool {
        switch code {
        case 200...304:
            return true
        default:
            return false
        }
    }
}
