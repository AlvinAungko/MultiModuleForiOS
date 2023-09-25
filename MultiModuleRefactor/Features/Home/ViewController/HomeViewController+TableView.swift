//
//  HomeViewController+TableView.swift
//  MultiModuleRefactor
//
//  Created by Aung Ko Ko on 24/09/2023.
//

import Foundation
import UIKit
import UIComponent

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: StudentTableViewCell.className, for: indexPath) as? StudentTableViewCell else {
            return UITableViewCell()
        }
        
        return cell
    }
}
