//
//  TableViewCellModelSelection.swift
//  TableView
//
//  Created by Vadym Zhydenko on 23.10.2020.
//

import Foundation

enum TableViewCellModelSelection {
    
    case none
    case some(() -> Void)
    
}
