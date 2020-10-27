//
//  ViewControllersFactory.swift
//  TableView
//
//  Created by Vadym Zhydenko on 28.10.2020.
//

import UIKit

protocol ViewControllersFactory {
    
    func navigationController() -> UINavigationController
    
}

extension ViewControllersFactory {
    
    func navigationController() -> UINavigationController {
        UINavigationController()
    }
    
}
