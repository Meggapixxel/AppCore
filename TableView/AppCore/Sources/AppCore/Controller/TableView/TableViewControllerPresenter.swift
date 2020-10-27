//
//  TableViewControllerPresenter.swift
//  TableView
//
//  Created by Vadym Zhydenko on 24.10.2020.
//

import Foundation

public protocol TableViewControllerPresenter: ViewControllerPresenter {
    
    var tableViewData: TableViewData? { get }
    
}
