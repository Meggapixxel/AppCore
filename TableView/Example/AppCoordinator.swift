//
//  AppCoordinator.swift
//  TableView
//
//  Created by Vadym Zhydenko on 27.10.2020.
//

import UIKit

final class AppCoordinator {
    
    let window: UIWindow
    let navigationController: UINavigationController
    
    private let viewControllersFactory: AppViewControllers
    
    init(window: UIWindow, viewControllersFactory: AppViewControllers) {
        self.window = window
        self.navigationController = viewControllersFactory.navigationController()
        self.viewControllersFactory = viewControllersFactory
    }
    
}

extension AppCoordinator: Coordinator {
    
    func start() {
        let viewController = viewControllersFactory.examples(
            singleSelectionTableViewData: { [weak self] in self?.pushSingleSelection() },
            multipleSectionsTableViewData: { [weak self] in self?.pushMultipleSection() },
            loadModeTableViewData: { [weak self] in self?.pushUpdatableSingleSection() }
        )
        navigationController.setViewControllers([viewController], animated: false)
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
}

private extension AppCoordinator {
    
    func pushSingleSelection() {
        let viewController = viewControllersFactory.singleSection()
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func pushMultipleSection() {
        let viewController = viewControllersFactory.multipleSection()
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func pushUpdatableSingleSection() {
        let viewController = viewControllersFactory.updatableSingleSection()
        navigationController.pushViewController(viewController, animated: true)
    }
    
}
