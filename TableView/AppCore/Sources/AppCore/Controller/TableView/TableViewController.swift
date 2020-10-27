//
//  TableViewController.swift
//  TableView
//
//  Created by Vadym Zhydenko on 24.10.2020.
//

import Foundation

public protocol TableViewController: ViewController {
    
    var tableViewPresenter: TableViewControllerPresenter! { get }
    
    func set(tableViewData: TableViewData?)
    
}

extension TableViewController {
    
    public var viewControllerPresenter: ViewControllerPresenter! { tableViewPresenter }
    
}
