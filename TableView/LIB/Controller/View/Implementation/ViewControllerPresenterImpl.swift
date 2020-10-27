//
//  ViewControllerPresenterImpl.swift
//  TableView
//
//  Created by Vadym Zhydenko on 25.10.2020.
//

import Foundation

class ViewControllerPresenterImpl<T: ViewController>: ViewControllerPresenter {
    
    private(set) weak var view: T?
    
    let navigateDismiss: (T) -> Void
    
    init(navigateDismiss: @escaping (T) -> Void) {
        self.navigateDismiss = navigateDismiss
    }
    
    func set(view: T) {
        self.view = view
    }
    
    func viewDidLoad() {
        
    }
    
    func dismiss() {
        guard let view = view else { return }
        navigateDismiss(view)
    }
    
}
