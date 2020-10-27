//
//  TableViewControllerPresenterImpl.swift
//  TableView
//
//  Created by Vadym Zhydenko on 24.10.2020.
//

import Foundation

open class TableViewControllerPresenterImpl<T: TableViewController>: ViewControllerPresenterImpl<T>, TableViewControllerPresenter {
    
    open var tableViewData: TableViewData? {
        didSet {
            view?.set(tableViewData: tableViewData)
        }
    }
    
}
