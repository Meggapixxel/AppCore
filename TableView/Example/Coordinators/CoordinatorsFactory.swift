//
//  CoordinatorsFactory.swift
//  TableView
//
//  Created by Vadym Zhydenko on 27.10.2020.
//

import UIKit
import AppCore

protocol CoordinatorsFactory {
    
    func app(window: UIWindow) -> Coordinator
    func examplePush(navigationController: UINavigationController, presenter: TableViewControllerExamplePresenter.Type) -> Coordinator
    func examplePresent(navigationController: UINavigationController, presenter: TableViewControllerExamplePresenter.Type) -> Coordinator
    
}

final class CoordinatorsFactoryImpl {
    
}

extension CoordinatorsFactoryImpl: CoordinatorsFactory {
    
    func app(window: UIWindow) -> Coordinator {
        AppCoordinator(window: window, viewControllersFactory: AppViewControllersFactoryImpl(), coordinatorsFactory: self)
    }
    
    func examplePush(navigationController: UINavigationController, presenter: TableViewControllerExamplePresenter.Type) -> Coordinator {
        ExamplePushCoordinator(navigationContoller: navigationController, viewControllersFactory: ExamplePushViewControllersFactoryImpl(), presenter: presenter)
    }
    
    func examplePresent(navigationController: UINavigationController, presenter: TableViewControllerExamplePresenter.Type) -> Coordinator {
        ExamplePresentCoordinator(navigationContoller: navigationController, viewControllersFactory: ExamplePresentViewControllersFactoryImpl(), presenter: presenter)
    }
    
}
