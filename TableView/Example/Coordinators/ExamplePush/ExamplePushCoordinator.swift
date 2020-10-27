//
//  ExamplePushCoordinator.swift
//  TableView
//
//  Created by Vadym Zhydenko on 27.10.2020.
//

import UIKit
import AppCore

final class ExamplePushCoordinator: Coordinator {
    
    private weak var navigationContoller: UINavigationController!
    private let viewControllersFactory: ExamplePushViewControllersFactory
    private let presenter: TableViewControllerExamplePresenter.Type
    
    private var viewControllerObservation: NSKeyValueObservation?
    
    init(navigationContoller: UINavigationController, viewControllersFactory: ExamplePushViewControllersFactory, presenter: TableViewControllerExamplePresenter.Type) {
        self.navigationContoller = navigationContoller
        self.presenter = presenter
        self.viewControllersFactory = viewControllersFactory
    }

    // MARK: - Coordinator
    var parent: Coordinator?
    var child: Coordinator?
    
    func start() {
        let presenter = self.presenter.init { (viewController) in
            viewController.navigationController?.popViewController(animated: true)
        }
        let viewController = viewControllersFactory.tableViewControllerExample(presenter: presenter)
        viewControllerObservation = viewController.observe(\.parent, options: [.new]) { [weak self] (viewController, change) in
            guard change.newValue == Optional<UIViewController>(nil) else { return }
            self?.viewControllerObservation?.invalidate()
            self?.dismiss()
        }
        navigationContoller.pushViewController(viewController, animated: true)
    }
    
}
