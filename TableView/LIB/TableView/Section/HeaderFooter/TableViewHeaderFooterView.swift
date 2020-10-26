//
//  TableViewHeaderFooterView.swift
//  TableView
//
//  Created by Vadym Zhydenko on 23.10.2020.
//

import UIKit

protocol TableViewHeaderFooterView: UITableViewHeaderFooterView {
    
    @discardableResult func configure(using model: TableViewHeaderFooterViewModel) -> Self
    
}
