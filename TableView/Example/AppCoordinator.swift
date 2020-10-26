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
    
    init(window: UIWindow = UIWindow(frame: UIScreen.main.bounds), viewControllersFactory: AppViewControllers) {
        self.window = window
        self.navigationController = viewControllersFactory.navigationController()
        self.viewControllersFactory = viewControllersFactory
    }
    
}

extension AppCoordinator: Coodinator {
    
    func start() {
        let viewController = viewControllersFactory.examples(
            singleSelection: { [weak self] in self?.pushSingleSelection() },
            multipleSection: { [weak self] in self?.pushMultipleSection() },
            updatableSingleSection: { [weak self] in self?.pushUpdatableSingleSection() }
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
