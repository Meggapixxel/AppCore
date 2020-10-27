//
//  TableViewSubviewHeight.swift
//  TableView
//
//  Created by Vadym Zhydenko on 23.10.2020.
//

import UIKit

public enum TableViewSubviewHeight {
    
    case fill
    case constant(CGFloat)
    
    var value: CGFloat {
        switch self {
        case .fill: return UITableView.automaticDimension
        case .constant(let value): return value
        }
    }
    
}
