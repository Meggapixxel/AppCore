//
//  TableViewCellExampleModel.swift
//  TableView
//
//  Created by Vadym Zhydenko on 01.11.2020.
//

import AppCore
import UIKit

final class TableViewCellExampleModel: TableViewCellModel {
    
    var viewClass: TableViewCellClass { .nib(TableViewCellExample.self) }
    let selection: TableViewCellModelSelection
    
    let color: UIColor
    let text: String
    let textAlignment: NSTextAlignment
    
    init(
        color: UIColor,
        text: String,
        textAlignment: NSTextAlignment,
        selection: TableViewCellModelSelection
    ) {
        self.color = color
        self.text = text
        self.textAlignment = textAlignment
        self.selection = selection
    }
    
}
