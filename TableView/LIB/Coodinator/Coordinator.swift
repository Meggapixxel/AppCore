//
//  Coordinator.swift
//  TableView
//
//  Created by Vadym Zhydenko on 27.10.2020.
//

import Foundation

protocol Coordinator: class {
    
    var parent: Coordinator? { get set }
    var child: Coordinator? { get set }
    
    func start()
    
}

extension Coordinator {
    
    func present(coordinator: Coordinator) {
        child = coordinator
        coordinator.parent = self
        coordinator.start()
    }
    
    func dismiss() {
        child?.dismiss()
        parent?.child = nil
    }
    
    var rootCoordinator: Coordinator { recursiveRootCoordinator(self) }
    private func recursiveRootCoordinator(_ coordinator: Coordinator) -> Coordinator {
        if let parent = coordinator.parent {
            return recursiveRootCoordinator(parent)
        } else {
            return coordinator
        }
    }
    
}

class BaseCoordinator: Coordinator {
    
    final weak var parent: Coordinator?
    final var child: Coordinator?
    
    func start() {
        fatalError("\(#function) not overrided")
    }
    
}
