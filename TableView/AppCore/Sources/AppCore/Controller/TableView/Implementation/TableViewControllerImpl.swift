//
//  TableViewController.swift
//  TableView
//
//  Created by Vadym Zhydenko on 24.10.2020.
//

import UIKit

open class TableViewControllerImpl: ViewControllerImpl, TableViewController {
    
    let tableView = UITableView()
    
    open override func setupUI() {
        super.setupUI()
        setupTableView()
    }
    
    // MARK: - TableViewController
    public var tableViewPresenter: TableViewControllerPresenter!
    
    public func set(tableViewData: TableViewData?) {
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
