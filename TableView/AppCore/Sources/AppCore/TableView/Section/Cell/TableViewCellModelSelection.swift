//
//  TableViewCellModelSelection.swift
//  TableView
//
//  Created by Vadym Zhydenko on 23.10.2020.
//

import Foundation

public enum TableViewCellModelSelection {
    
    case none
    case some(() -> Void)
    
}
