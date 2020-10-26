//
//  HeaderFooterViewExampleModel.swift
//  TableView
//
//  Created by Vadym Zhydenko on 25.10.2020.
//

import Foundation

struct HeaderFooterViewExampleModel: TableViewHeaderFooterViewModel {
    
    var viewClass: TableViewHeaderFooterViewClass { .anyClass(HeaderFooterViewExample.self) }

    let text: String

}
