//
//  CombineNetworkManager.swift
//  Networking
//
//  Created by Aung Ko Ko on 29/09/2023.
//

import Foundation
import Combine

open class CombineNetworkManager {
    
    public static let shared = CombineNetworkManager()
    
    private init() {}
    
    open func fetchData<M: Decodable>(configuration: Configuration, responseType: M.Type) -> AnyPublisher<M, ServiceError> {
        
        var dataTask: URLSessionDataTask?
        
        let onSubscription: (Subscription) -> Void = { _ in dataTask?.resume() }
        let onCancel: () -> Void = { dataTask?.cancel() }
        
        return Future<M, ServiceError> { promise in
            
            let parameters = NetworkHelper.shared.generateParams(task: configuration.task)
            let url = configuration.baseURL + configuration.path.escape()
            guard var components = URLComponents(string: url) else {
                promise(.failure(ServiceError(issueCode: .SESSION_NOT_FOUND)))
                return
            }
            
            if configuration.method == HTTPMethod.get {
                components.queryItems = parameters.0.map { key, value in
                    URLQueryItem(name: key, value: "\(value)")
                }
                components.percentEncodedQuery = components.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B")
            }
            
            guard let url = components.url else {
                promise(.failure(ServiceError(issueCode: .SESSION_NOT_FOUND)))
                return
            }
            
            let request = NetworkHelper.shared.generateRequest(url: url,
                                                               method: configuration.method.rawValue,
                                                               headers: configuration.headers)
            
            if configuration.method == HTTPMethod.post {
                let jsonData = try? JSONSerialization.data(withJSONObject: parameters.0, options: [])
                request.httpBody = jsonData
            }
            
            Logger.log(request: request)
            
            
            dataTask = URLSession.shared.dataTask(with: request as URLRequest) { (data, _, error) in
                guard let data = data else {
                    if let error = error {
                        promise(.failure(ServiceError(issueCode: .CUSTOM_MES(message: error.localizedDescription))))
                    }
                    return
                }
                do {
                    let response = try JSONDecoder().decode(M.self, from: data)
                    promise(.success(response))
                } catch {
                    promise(.failure(ServiceError(issueCode: .CUSTOM_MES(message: "Decode Error"))))
                }
            }
        }
        .handleEvents(receiveSubscription: onSubscription, receiveCancel: onCancel)
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
        
    }
}
