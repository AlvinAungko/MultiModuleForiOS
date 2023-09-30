//
//  CourseListViewController.swift
//  CombineStarter
//
//  Created by Aung Ko Ko on 29/09/2023.
//

import UIKit
import UIComponent
import Utilities
import Combine

protocol CourseListNavigationDelagate: AnyObject {
    func routeToDetailPage()
}

protocol CourseListPopBackDelegate: AnyObject {
    func routeBackToCourseList()
}

protocol CourseListViewControllerDelegate: AnyObject {
    func didTapCourse(course: Course)
}

class CourseListViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var dataSource: UITableViewDiffableDataSource<CourseHeader, ItemType>?
    var snapShot: NSDiffableDataSourceSnapshot<CourseHeader, ItemType>?
    var listOfCourses: [Course]?
    var viewModel: CourseListViewModel?
    private var bindings = Set<AnyCancellable>()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = CourseListViewModel()
        self.viewModel?.dataManager = CourseListDataManager()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Init not called")
    }
    
    override func setupUI() {
        super.setupUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        dataBinding()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel?.fetchData()
    }
    
    private func dataBinding() {
        viewModel?.$coures
            .receive(on: RunLoop.main)
            .sink(receiveValue: { [weak self] _ in
                self?.updateDataSource()
            })
            .store(in: &bindings)
    }
    
    private func setupTableView() {
        tableView.backgroundColor = .clear
        tableView.registerCells(CourseDetailTableViewCell.className)
        tableView.contentInset = .zero
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
    }
    
    private func setupDataSource() {
        
        dataSource = UITableViewDiffableDataSource<CourseHeader, ItemType>(tableView: self.tableView, cellProvider: { tableView, indexPath, itemIdentifier in
            switch itemIdentifier {
            case .itemTypeForCourseSection(let course):
                guard let cell = tableView.dequeueReusableCell(withIdentifier: CourseDetailTableViewCell.className, for: indexPath) as? CourseDetailTableViewCell else {
                    return UITableViewCell()
                }
                cell.item = course[indexPath.row]
                return cell
            }
        })
        
        dataSource?.defaultRowAnimation = .fade
        self.snapShot = NSDiffableDataSourceSnapshot<CourseHeader, ItemType>()
    }
    
    private func updateDataSource() {
        self.snapShot?.appendSections([.mainCourse])
        self.snapShot?.appendItems([ItemType.itemTypeForCourseSection(self.listOfCourses ?? [])], toSection: .mainCourse)
        dataSource?.apply(snapShot!, animatingDifferences: true)
    }
    
}

extension CourseListViewController: CourseListNavigationDelagate {
    func routeToDetailPage() {
        
    }
}
