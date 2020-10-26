//
//  AppDelegate.swift
//  TableView
//
//  Created by Vadym Zhydenko on 23.10.2020.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        
        let presenter = TableViewPresenterExamples(
            singleSelection: { [weak self] in self?.pushSingleSelection() },
            multipleSection: { [weak self] in self?.pushMultipleSection() },
            updatableSingleSection: { [weak self] in self?.pushUpdatableSingleSection() }
        )
        let viewController = TableViewControllerExample(presenter: presenter)
        presenter.set(view: viewController)
        
        window.rootViewController = UINavigationController(rootViewController: viewController)
        window.makeKeyAndVisible()
        return true
    }

    func pushSingleSelection() {
        let presenter = TableViewPresenterExample1()
        let viewController = TableViewControllerExample(presenter: presenter)
        presenter.set(view: viewController)
        (window?.rootViewController as? UINavigationController)?.pushViewController(viewController, animated: true)
    }
    
    func pushMultipleSection() {
        let presenter = TableViewPresenterExample2()
        let viewController = TableViewControllerExample(presenter: presenter)
        presenter.set(view: viewController)
        (window?.rootViewController as? UINavigationController)?.pushViewController(viewController, animated: true)
    }
    
    func pushUpdatableSingleSection() {
        let presenter = TableViewPresenterExample3()
        let viewController = TableViewControllerExample(presenter: presenter)
        presenter.set(view: viewController)
        (window?.rootViewController as? UINavigationController)?.pushViewController(viewController, animated: true)
    }
    
}

