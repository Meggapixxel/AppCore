//
//  TableViewControllerExampleViewsFactory.swift
//  TableView
//
//  Created by Vadym Zhydenko on 28.10.2020.
//

import AppCore

struct TableViewControllerExampleViewsFactory {
    
    static func cellList(text: String, selection: @escaping () -> Void) -> TableViewCellModel {
        TableViewCellExampleModel(
            color: .white,
            text: text,
            textAlignment: .center,
            selection: .some(selection)
        )
    }
    
    static func cellDetails(text: String = .random(maxLength: 200)) -> TableViewCellModel {
        TableViewCellExampleModel(
            color: .random(),
            text: text,
            textAlignment: .left,
            selection: .none
        )
    }
    
    static func headerFooterView(text: String) -> TableViewHeaderFooterViewModel {
        HeaderFooterViewExampleModel(text: text)
    }
    
}
