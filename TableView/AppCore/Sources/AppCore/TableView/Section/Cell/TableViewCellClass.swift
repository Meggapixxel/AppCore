//
//  TableViewCellClass.swift
//  TableView
//
//  Created by Vadym Zhydenko on 23.10.2020.
//

import Foundation

public enum TableViewCellClass {
    
    case nib(TableViewCell.Type)
    case anyClass(TableViewCell.Type)
    
    var value: TableViewCell.Type {
        switch self {
        case .nib(let viewClass): return viewClass
        case .anyClass(let viewClass): return viewClass
        }
    }
    
}
