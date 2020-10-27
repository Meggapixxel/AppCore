//
//  ViewControllerPresenterImpl.swift
//  TableView
//
//  Created by Vadym Zhydenko on 25.10.2020.
//

import Foundation

open class ViewControllerPresenterImpl<T: ViewController>: ViewControllerPresenter {
    
    private(set) weak var view: T?
    
    private let navigateDismiss: (T) -> Void
    
    public init(navigateDismiss: @escaping (T) -> Void) {
        self.navigateDismiss = navigateDismiss
    }
    
    public func set(view: T) {
        self.view = view
    }
    
    open func viewDidLoad() {
        
    }
    
    public func dismiss() {
        guard let view = view else { return }
        navigateDismiss(view)
    }
    
}
