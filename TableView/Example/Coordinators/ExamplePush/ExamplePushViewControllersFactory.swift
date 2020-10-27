//
//  ExamplePushViewControllersFactory.swift
//  TableView
//
//  Created by Vadym Zhydenko on 27.10.2020.
//

import UIKit

protocol ExamplePushViewControllersFactory {
    
    func tableViewControllerExample(presenter: TableViewControllerExamplePresenter) -> UIViewController
    
}

final class ExamplePushViewControllersFactoryImpl: ExamplePushViewControllersFactory {
    
    func tableViewControllerExample(presenter: TableViewControllerExamplePresenter) -> UIViewController {
        let viewController = TableViewControllerExample(presenter: presenter)
        presenter.set(view: viewController)
        return viewController
    }
    
}
