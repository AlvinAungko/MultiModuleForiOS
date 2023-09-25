//
//  HomeViewController.swift
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
import UIComponent
import Utilities
import Networking

protocol HomeDisplayLogic: AnyObject {
    func presentStudentList(response: Home.Something.ViewModel)
    func presentError(err: ServiceError)
}

class HomeViewController: BaseViewController, HomeDisplayLogic {
    
    @IBOutlet weak var tableView: UITableView!
    
    var interactor: HomeBusinessLogic?
    var router: (HomeRoutingLogic & HomeDataPassing)?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        let interactor = HomeInteractor()
        let presenter = HomePresenter()
        let router = HomeRouter()
        let worker = HomeWorker()
        self.interactor = interactor
        self.router = router
        interactor.presenter = presenter
        interactor.worker = worker
        presenter.viewController = self
        router.viewController = self
        router.dataStore = interactor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.fetchListOfStudents()
    }
    
    override func setupUI() {
        super.setupUI()
        setupTableView()
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .clear
        tableView.contentInset = .zero
        tableView.registerCells(StudentTableViewCell.className)
    }
    
    func presentStudentList(response: Home.Something.ViewModel) {
        response.studentList.forEach {
            if let student = $0 {
                debugPrint(student.studentName ?? "")
            }
        }
    }
    
    func presentError(err: ServiceError) {
        switch err.issueCode {
        case .SESSION_EXPIRE:
            debugPrint("Expire Session.")
        case .CUSTOM_MES(let msg): debugPrint("\(msg)")
        case .SESSION_NOT_FOUND: debugPrint("SESSION_NOT_FOUND")
        case .TIME_OUT: debugPrint("TIME_OUT")
        case .UNAUTHORIZED: debugPrint("UNAUTHORIZED")
        }
    }
}
