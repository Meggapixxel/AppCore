//
//  Example2.swift
//  TableView
//
//  Created by Vadym Zhydenko on 25.10.2020.
//

import Foundation
import AppCore

final class TableViewPresenterExample2: TableViewControllerExamplePresenterImpl {
    
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
            sectionModels: (1...5).randomElement()!.makeArray { index in
                TableViewSectionModelImpl(
                    headerModel: TableViewControllerExampleViewsFactory.headerFooterView(text: "header \(index)"),
                    footerModel: TableViewControllerExampleViewsFactory.headerFooterView(text: "footer \(index)"),
                    cellModels: (1...20).randomElement()!.makeArray {
                        TableViewControllerExampleViewsFactory.cellDetails()
                    }
                )
            }
        )
    }
    
}
