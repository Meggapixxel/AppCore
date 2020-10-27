//
//  TableViewControllerExamplePresenter.swift
//  TableView
//
//  Created by Vadym Zhydenko on 27.10.2020.
//

import Foundation
import AppCore

protocol TableViewControllerExamplePresenter: TableViewControllerPresenter {
    init(navigateDismiss: @escaping (TableViewControllerExample) -> Void)
    func set(view: TableViewControllerExample)
}

class TableViewControllerExamplePresenterImpl: TableViewControllerPresenterImpl<TableViewControllerExample> {
    
    required override init(navigateDismiss: @escaping (TableViewControllerExample) -> Void) {
        super.init(navigateDismiss: navigateDismiss)
    }
    
}
extension TableViewControllerExamplePresenterImpl: TableViewControllerExamplePresenter {
    
}
