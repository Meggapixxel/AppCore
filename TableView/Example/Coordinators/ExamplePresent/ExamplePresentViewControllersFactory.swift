//
//  ExamplePresentViewControllersFactory.swift
//  TableView
//
//  Created by Vadym Zhydenko on 27.10.2020.
//

import UIKit

protocol ExamplePresentViewControllersFactory {
    
    func tableViewControllerExample(presenter: TableViewControllerExamplePresenter) -> UIViewController
    
}

final class ExamplePresentViewControllersFactoryImpl: ExamplePresentViewControllersFactory {
    
    func tableViewControllerExample(presenter: TableViewControllerExamplePresenter) -> UIViewController {
        let viewController = TableViewControllerExample(presenter: presenter)
        presenter.set(view: viewController)
        return viewController
    }
    
}
