//
//  AppViewControllersFactory.swift
//  TableView
//
//  Created by Vadym Zhydenko on 27.10.2020.
//

import UIKit

protocol AppViewControllersFactory {
    
    func navigationController() -> UINavigationController

    func examples(singleSelectionTableViewData: @escaping () -> Void, multipleSectionsTableViewData: @escaping () -> Void, loadModeTableViewData: @escaping () -> Void, navigateDismiss: @escaping (TableViewControllerExample) -> Void) -> UIViewController
    
}

final class AppViewControllersFactoryImpl: AppViewControllersFactory {
    
    func navigationController() -> UINavigationController {
        UINavigationController()
    }
    
    func examples(singleSelectionTableViewData: @escaping () -> Void, multipleSectionsTableViewData: @escaping () -> Void, loadModeTableViewData: @escaping () -> Void, navigateDismiss: @escaping (TableViewControllerExample) -> Void) -> UIViewController {
        let presenter = TableViewPresenterExamples(
            singleSelectionTableViewData: singleSelectionTableViewData,
            multipleSectionsTableViewData: multipleSectionsTableViewData,
            loadModeTableViewData: loadModeTableViewData,
            navigateDismiss: navigateDismiss
        )
        let viewController = TableViewControllerExample(presenter: presenter)
        presenter.set(view: viewController)
        return viewController
    }
    
}
