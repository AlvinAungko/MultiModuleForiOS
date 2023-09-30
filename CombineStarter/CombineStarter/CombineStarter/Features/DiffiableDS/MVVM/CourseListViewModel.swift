//
//  CourseListViewModel.swift
//  CombineStarter
//
//  Created by Aung Ko Ko on 29/09/2023.
//

import Foundation
import Combine
import Networking

enum CourseListViewModelState: Equatable {
    case loading
    case finishedLoading
    case error(IssueCode)
}

protocol CourseListViewModelProtocol {
    var dataManager: CourseListDataManager? { get set }
}

class CourseListViewModel: CourseListViewModelProtocol {
    
    @Published private(set) var coures: [Course] = []
    @Published private(set) var state: CourseListViewModelState = .loading
    private var bindings = Set<AnyCancellable>()
    var dataManager: CourseListDataManager?
    
    var fetchCourseCompletionHander: ((Subscribers.Completion<ServiceError>) -> Void)?
    var fetchCourseValueHandler: (([Course]) -> Void)?
    
    
    public func fetchData() {
        
        fetchCourseCompletionHander = { [weak self] completion in
            switch completion {
            case .finished:
                self?.state = .finishedLoading
            case .failure(let issue):
                self?.state = .error(issue.issueCode)
            }
        }
        
        fetchCourseValueHandler = { [weak self] response in
            self?.coures = response
        }
        
        guard let fetchCourseCompletionHander = fetchCourseCompletionHander, let fetchCourseValueHandler = fetchCourseValueHandler else {
            return
        }
        
        dataManager?.fetchList()
            .sink(receiveCompletion: fetchCourseCompletionHander, receiveValue: fetchCourseValueHandler)
            .store(in: &bindings)
    }
    
}
