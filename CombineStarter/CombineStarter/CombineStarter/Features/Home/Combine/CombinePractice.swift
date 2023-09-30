//
//  CombinePractice.swift
//  CombineStarter
//
//  Created by Aung Ko Ko on 26/09/2023.
//

import Foundation
import Combine

class CombinePractice {
    
    let helloPublisher = "Hello".publisher
    let fibonanciPublisher = [0, 10, 20, 30].publisher
    let dictPublisher = [
        "Sample": 1,
        "Dimple": 20
    ].publisher
    
    
    let passThroughSubject = PassthroughSubject<String, Error>()
    let subject = CurrentValueSubject<String, Error>("Initial Value")
    
    func subscribeToPublisher() {
        
        let _ = helloPublisher.sink { completion in
            switch completion {
            case .failure(let never):
                debugPrint(never)
            case .finished:
                debugPrint("Finished")
            }
        } receiveValue: { response in
            debugPrint(response)
        }
        
        let _ = fibonanciPublisher.sink { completion in
            switch completion {
            case .finished:
                debugPrint("Finished!")
            case .failure(let never):
                debugPrint(never)
            }
        } receiveValue: { response in
            debugPrint(response)
        }
        
        let _ = dictPublisher.sink { completion in
            switch completion {
            case .finished:
                debugPrint("Finished")
            case .failure(let never):
                debugPrint(never)
            }
        } receiveValue: { response in
            debugPrint(response)
        }
    }
    
    func subscribeToPassThroughSubject() {
        self.passThroughSubject.send("Hello")
        self.passThroughSubject.send("World")
        self.passThroughSubject.send("Combine is better than Rx")
        let _ = self.passThroughSubject.sink { completion in
            switch completion {
            case .failure(let error):
                debugPrint(error)
            case .finished:
                debugPrint("Finished.")
            }
        } receiveValue: { response in
            debugPrint(response)
        }
        self.passThroughSubject.send("Haha JK")
    }
    
//    func subscribeToCurrentValueSubject() {
//        subject.send("Hello")
//        subject.send("World")
//        subject.sink(receiveValue: { value in
//            print(value)
//        })
//    }
    
}
