//
//  Coordinator.swift
//  TableView
//
//  Created by Vadym Zhydenko on 27.10.2020.
//

import Foundation

public protocol Coordinator: class {
    
    var parent: Coordinator? { get set }
    var child: Coordinator? { get set }
    
    func start()
    
}

public extension Coordinator {
    
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

open class BaseCoordinator: Coordinator {
    
    public final weak var parent: Coordinator?
    public final var child: Coordinator?
    
    open func start() {
        fatalError("\(#function) not overrided")
    }
    
}
