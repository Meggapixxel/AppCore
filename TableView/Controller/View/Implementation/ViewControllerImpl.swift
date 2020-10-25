//
//  ViewControllerImpl.swift
//  TableView
//
//  Created by Vadym Zhydenko on 25.10.2020.
//

import UIKit

class ViewControllerImpl: UIViewController, ViewController {
    
    var viewControllerPresenter: ViewControllerPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        viewControllerPresenter.viewDidLoad()
    }
    
    func setupUI() {
        view.backgroundColor = .white
    }

}
