//
//  Example1.swift
//  TableView
//
//  Created by Vadym Zhydenko on 24.10.2020.
//

import Foundation
import AppCore

final class TableViewPresenterExample1: TableViewControllerExamplePresenterImpl {
    
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
        tableViewData = TableViewDataImpl(
            cellModels: (20...50).randomElement()!.makeArray {
                TableViewControllerExampleViewsFactory.cellDetails()
            }
        )
    }
    
}
