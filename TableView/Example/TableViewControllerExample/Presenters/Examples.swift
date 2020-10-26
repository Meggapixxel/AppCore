//
//  Examples.swift
//  TableView
//
//  Created by Vadym Zhydenko on 24.10.2020.
//

import Foundation

final class TableViewPresenterExamples: TableViewControllerPresenterImpl<TableViewControllerExample> {
    
    private let singleSelection: () -> Void
    private let multipleSection: () -> Void
    private let updatableSingleSection: () -> Void
    
    init(
        singleSelection: @escaping () -> Void,
        multipleSection: @escaping () -> Void,
        updatableSingleSection: @escaping () -> Void
    ) {
        self.singleSelection = singleSelection
        self.multipleSection = multipleSection
        self.updatableSingleSection = updatableSingleSection
    }
    
    override func viewDidLoad() {
        tableViewData = TableViewDataImpl(
            cellModels: [
                TableViewCellPresenterExample.list(text: "SingleSection") { [weak self] in self?.singleSelection() },
                TableViewCellPresenterExample.list(text: "MultipleSection") { [weak self] in self?.multipleSection() },
                TableViewCellPresenterExample.list(text: "LoadMore") { [weak self] in self?.updatableSingleSection() },
            ]
        )
    }
    
}
