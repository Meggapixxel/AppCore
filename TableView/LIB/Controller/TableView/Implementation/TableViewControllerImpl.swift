//
//  TableViewController.swift
//  TableView
//
//  Created by Vadym Zhydenko on 24.10.2020.
//

import UIKit

class TableViewControllerImpl: ViewControllerImpl, TableViewController {
    
    let tableView = UITableView()
    
    override func setupUI() {
        super.setupUI()
        setupTableView()
    }
    
    // MARK: - TableViewController
    var tableViewPresenter: TableViewControllerPresenter!
    
    func set(tableViewData: TableViewData?) {
        tableViewData?.prepare(for: tableView)
    }
    
}

private extension TableViewControllerImpl {
    
    func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
}
