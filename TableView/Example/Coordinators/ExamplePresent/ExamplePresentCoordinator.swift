//
//  ExamplePresentCoordinator.swift
//  TableView
//
//  Created by Vadym Zhydenko on 27.10.2020.
//

import UIKit
import AppCore

final class ExamplePresentCoordinator: Coordinator {
    
    private weak var navigationContoller: UINavigationController!
    private let viewControllersFactory: ExamplePresentViewControllersFactory
    private let presenter: TableViewControllerExamplePresenter.Type
    
    init(navigationContoller: UINavigationController, viewControllersFactory: ExamplePresentViewControllersFactory, presenter: TableViewControllerExamplePresenter.Type) {
        self.navigationContoller = navigationContoller
        self.viewControllersFactory = viewControllersFactory
        self.presenter = presenter
    }

    // MARK: - Coordinator
    var parent: Coordinator?
    var child: Coordinator?
    
    func start() {
        let presenter = self.presenter.init { (viewController) in
            viewController.dismiss(animated: true) { [weak self] in
                self?.dismiss()
            }
        }
        let viewController = viewControllersFactory.tableViewControllerExample(presenter: presenter)
        navigationContoller.present(viewController, animated: true)
    }
    
}
