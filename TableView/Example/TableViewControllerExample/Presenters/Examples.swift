//
//  Examples.swift
//  TableView
//
//  Created by Vadym Zhydenko on 24.10.2020.
//

import Foundation

final class TableViewPresenterExamples: TableViewControllerPresenterImpl<TableViewControllerExample> {
    
    private let singleSelectionTableViewData: () -> Void
    private let multipleSectionsTableViewData: () -> Void
    private let loadModeTableViewData: () -> Void
    
    init(
        singleSelectionTableViewData: @escaping () -> Void,
        multipleSectionsTableViewData: @escaping () -> Void,
        loadModeTableViewData: @escaping () -> Void
    ) {
        self.singleSelectionTableViewData = singleSelectionTableViewData
        self.multipleSectionsTableViewData = multipleSectionsTableViewData
        self.loadModeTableViewData = loadModeTableViewData
    }
    
    override func viewDidLoad() {
        tableViewData = TableViewDataImpl(
            cellModels: [
                TableViewCellPresenterExample.list(text: "SingleSection") { [weak self] in self?.singleSelectionTableViewData() },
                TableViewCellPresenterExample.list(text: "MultipleSection") { [weak self] in self?.multipleSectionsTableViewData() },
                TableViewCellPresenterExample.list(text: "LoadMore") { [weak self] in self?.loadModeTableViewData() },
            ]
        )
    }
    
}
