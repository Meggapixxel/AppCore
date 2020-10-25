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
    private let updatableMultipleSection: () -> Void
    
    init(
        singleSelection: @escaping () -> Void,
        multipleSection: @escaping () -> Void,
        updatableSingleSection: @escaping () -> Void,
        updatableMultipleSection: @escaping () -> Void
    ) {
        self.singleSelection = singleSelection
        self.multipleSection = multipleSection
        self.updatableSingleSection = updatableSingleSection
        self.updatableMultipleSection = updatableMultipleSection
    }
    
    override func viewDidLoad() {
        tableViewData = TableViewSingleSectionDataImpl(
            cellModels: [
                TableViewCellPresenterExample.list(text: "SingleSection") { [weak self] in self?.singleSelection() },
                TableViewCellPresenterExample.list(text: "MultipleSection") { [weak self] in self?.multipleSection() },
                TableViewCellPresenterExample.list(text: "SingleSection+LoadMore") { [weak self] in self?.updatableSingleSection() },
                TableViewCellPresenterExample.list(text: "MultipleSection+LoadMore") { [weak self] in self?.updatableMultipleSection() }
            ]
        )
    }
    
}
