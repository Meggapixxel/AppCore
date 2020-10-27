//
//  ViewControllerPresenter.swift
//  TableView
//
//  Created by Vadym Zhydenko on 25.10.2020.
//

import Foundation

public protocol ViewControllerPresenter: class {
    
    func viewDidLoad()
    
    func dismiss()
    
}

extension ViewControllerPresenter {
    
    public func viewDidLoad() {
        
    }
    
}
