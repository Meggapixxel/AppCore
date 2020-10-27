//
//  TableViewHeaderFooterViewClass.swift
//  TableView
//
//  Created by Vadym Zhydenko on 23.10.2020.
//

import Foundation

public enum TableViewHeaderFooterViewClass {

    case nib(TableViewHeaderFooterView.Type)
    case anyClass(TableViewHeaderFooterView.Type)

    var value: TableViewHeaderFooterView.Type {
        switch self {
        case .nib(let viewClass): return viewClass
        case .anyClass(let viewClass): return viewClass
        }
    }

}
