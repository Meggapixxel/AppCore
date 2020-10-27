//
//  TableViewControllerExample.swift
//  TableView
//
//  Created by Vadym Zhydenko on 24.10.2020.
//

import UIKit
import AppCore

final class TableViewControllerExample: TableViewControllerImpl {
    
    init(presenter: TableViewControllerPresenter) {
        super.init(nibName: nil, bundle: nil)
        self.viewControllerPresenter = presenter
        self.tableViewPresenter = presenter
    }
    
    @available(iOS, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
