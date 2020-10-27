//
//  ViewControllerImpl.swift
//  TableView
//
//  Created by Vadym Zhydenko on 25.10.2020.
//

import UIKit

open class ViewControllerImpl: UIViewController, ViewController {
    
    public var viewControllerPresenter: ViewControllerPresenter!
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        viewControllerPresenter.viewDidLoad()
    }
    
    open func setupUI() {
        view.backgroundColor = .white
    }

}
