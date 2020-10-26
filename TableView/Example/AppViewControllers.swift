//
//  AppViewControllers.swift
//  TableView
//
//  Created by Vadym Zhydenko on 27.10.2020.
//

import UIKit

protocol AppViewControllers {
    
    func navigationController() -> UINavigationController

    func examples(singleSelectionTableViewData: @escaping () -> Void, multipleSectionsTableViewData: @escaping () -> Void, loadModeTableViewData: @escaping () -> Void) -> UIViewController
    
    func singleSection() -> UIViewController
    
    func multipleSection() -> UIViewController
    
    func updatableSingleSection() -> UIViewController
    
}

final class AppViewControllersImpl: AppViewControllers {
    
    func navigationController() -> UINavigationController {
        UINavigationController()
    }
    
    func examples(singleSelectionTableViewData: @escaping () -> Void, multipleSectionsTableViewData: @escaping () -> Void, loadModeTableViewData: @escaping () -> Void) -> UIViewController {
        let presenter = TableViewPresenterExamples(
            singleSelectionTableViewData: singleSelectionTableViewData,
            multipleSectionsTableViewData: multipleSectionsTableViewData,
            loadModeTableViewData: loadModeTableViewData
        )
        let viewController = TableViewControllerExample(presenter: presenter)
        presenter.set(view: viewController)
        return viewController
    }
    
    func singleSection() -> UIViewController {
        let presenter = TableViewPresenterExample1()
        let viewController = TableViewControllerExample(presenter: presenter)
        presenter.set(view: viewController)
        return viewController
    }
    
    func multipleSection() -> UIViewController {
        let presenter = TableViewPresenterExample2()
        let viewController = TableViewControllerExample(presenter: presenter)
        presenter.set(view: viewController)
        return viewController
    }
    
    func updatableSingleSection() -> UIViewController {
        let presenter = TableViewPresenterExample3()
        let viewController = TableViewControllerExample(presenter: presenter)
        presenter.set(view: viewController)
        return viewController
    }
    
}
