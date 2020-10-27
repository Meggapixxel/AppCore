//
//  AppViewControllersFactory.swift
//  TableView
//
//  Created by Vadym Zhydenko on 27.10.2020.
//

import UIKit

protocol AppViewControllersFactory {
    
    func navigationController() -> UINavigationController

    func examples(example1: @escaping () -> Void, example2: @escaping () -> Void, example3: @escaping () -> Void, navigateDismiss: @escaping (TableViewControllerExample) -> Void) -> UIViewController
    
}

final class AppViewControllersFactoryImpl: AppViewControllersFactory {
    
    func navigationController() -> UINavigationController {
        UINavigationController()
    }
    
    func examples(example1: @escaping () -> Void, example2: @escaping () -> Void, example3: @escaping () -> Void, navigateDismiss: @escaping (TableViewControllerExample) -> Void) -> UIViewController {
        let presenter = TableViewPresenterExamples(
            example1: example1,
            example2: example2,
            example3: example3,
            navigateDismiss: navigateDismiss
        )
        let viewController = TableViewControllerExample(presenter: presenter)
        presenter.set(view: viewController)
        return viewController
    }
    
}
