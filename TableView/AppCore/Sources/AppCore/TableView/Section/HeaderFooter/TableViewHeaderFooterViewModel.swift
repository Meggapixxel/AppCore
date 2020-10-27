//
//  TableViewHeaderFooterViewModel.swift
//  TableView
//
//  Created by Vadym Zhydenko on 23.10.2020.
//

import Foundation

public protocol TableViewHeaderFooterViewModel {
    
    var viewClass: TableViewHeaderFooterViewClass { get }
    var viewReuseIdentifier: String { get }
    var viewHeight: TableViewSubviewHeight { get }
    
}

public extension TableViewHeaderFooterViewModel {
    
    var viewReuseIdentifier: String { String(describing: viewClass.value) }
    var viewHeight: TableViewSubviewHeight { .fill }
    
}
