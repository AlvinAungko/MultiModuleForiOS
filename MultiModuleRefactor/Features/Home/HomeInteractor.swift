//
//  HomeInteractor.swift
//  MultiModuleRefactor
//
//  Created by Aung Ko Ko on 24/09/2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol HomeBusinessLogic {
    func fetchListOfStudents()
}

protocol HomeDataStore {
   
}

class HomeInteractor: HomeBusinessLogic, HomeDataStore {
    
    var presenter: HomePresentationLogic?
    var worker: HomeWorker?
    
    func fetchListOfStudents() {
        worker?.fetchStudents(networkConfig: .listOfStudents, completion: { [weak self] response in
            guard let self = self else { return }
            self.presenter?.presentStudentList(response: Home.Something.ViewModel.init(studentList: response))
        }, failure: { [weak self] failure in
            guard let self = self else { return }
            self.presenter?.presentError(err: failure)
        })
    }
}
