//
//  Example3.swift
//  TableView
//
//  Created by Vadym Zhydenko on 24.10.2020.
//

import Foundation

final class TableViewPresenterExample3: TableViewControllerExamplePresenterImpl {
    
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
        tableViewData = TableViewLoadMoreDataImpl(
            sectionModels: [
                TableViewSectionModelImpl(
                    cellModels: 20.makeArray { index in
                        TableViewCellPresenterExample.details(text: String(index))
                    }
                )
            ],
            onLoadMore: { (tableViewData, completion) in
                let cellsCount = tableViewData.sectionModels.reduce(into: 0, { $0 += $1.cellModels.count })
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    completion(
                        [
                            TableViewSectionModelImpl(
                                cellModels: (10...20).randomElement()!.makeArray { index in
                                    TableViewCellPresenterExample.details(text: String(cellsCount + index))
                                }
                            )
                        ]
                    )
                }
            }
        )
    }
    
}
