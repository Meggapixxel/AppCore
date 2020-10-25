//
//  SingleSection.swift
//  TableView
//
//  Created by Vadym Zhydenko on 24.10.2020.
//

import Foundation

final class TableViewPresenterSingleSectionExample: TableViewControllerPresenterImpl<TableViewControllerExample> {
    
    override func viewDidLoad() {
        fetchData()
    }
    
    func fetchData() {
        tableViewData = TableViewLoadingData()
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
            DispatchQueue.main.async { [weak self] in
                self?.endLoadMore()
            }
        }
    }
    
    func endLoadMore() {
        tableViewData = TableViewSingleSectionDataImpl(
            cellModels: (1...20).randomElement()!.makeArray {
                TableViewCellPresenterExample.details()
            }
        )
    }
    
}
