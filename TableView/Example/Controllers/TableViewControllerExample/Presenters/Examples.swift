//
//  Examples.swift
//  TableView
//
//  Created by Vadym Zhydenko on 24.10.2020.
//

import Foundation
import AppCore

final class TableViewPresenterExamples: TableViewControllerExamplePresenterImpl {
    
    private let example1: () -> Void
    private let example2: () -> Void
    private let example3: () -> Void
    
    init(
        example1: @escaping () -> Void,
        example2: @escaping () -> Void,
        example3: @escaping () -> Void,
        navigateDismiss: @escaping (TableViewControllerExample) -> Void
    ) {
        self.example1 = example1
        self.example2 = example2
        self.example3 = example3
        super.init(navigateDismiss: navigateDismiss)
    }
    
    required init(navigateDismiss: @escaping (TableViewControllerExample) -> Void) {
        fatalError("init(navigateDismiss:) has not been implemented")
    }
    
    override func viewDidLoad() {
        
        tableViewData = TableViewDataImpl(
            cellModels: [
                TableViewControllerExampleViewsFactory.cellList(text: "SingleSection") { [weak self] in self?.example1() },
                TableViewControllerExampleViewsFactory.cellList(text: "MultipleSection") { [weak self] in self?.example2() },
                TableViewControllerExampleViewsFactory.cellList(text: "LoadMore") { [weak self] in self?.example3() }
            ]
        )
    }
    
}
