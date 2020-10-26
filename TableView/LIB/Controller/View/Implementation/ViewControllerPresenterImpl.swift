//
//  ViewControllerPresenterImpl.swift
//  TableView
//
//  Created by Vadym Zhydenko on 25.10.2020.
//

import Foundation

class ViewControllerPresenterImpl<T: ViewController>: ViewControllerPresenter {
    
    private(set) weak var view: T?
    
    func set(view: T) {
        self.view = view
    }
    
    func viewDidLoad() {
        
    }
    
}
