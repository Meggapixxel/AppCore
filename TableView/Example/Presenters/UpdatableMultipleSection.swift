//
//  UpdatableMultipleSection.swift
//  TableView
//
//  Created by Vadym Zhydenko on 24.10.2020.
//

import Foundation

final class TableViewPresenterUpdatableMultipleSectionExample: TableViewControllerPresenterImpl<TableViewControllerExample> {
    
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
        tableViewData = TableViewMultipleSectionDataImpl(
            sectionModels: 3.makeArray {
                TableViewSectionModelImpl(
                    header: nil,
                    footer: nil,
                    cellModels: 10.makeArray {
                        TableViewCellPresenterExample.details()
                    }
                )
            },
            onLoadMore: { (tableViewData, completion) in
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    completion(
                        (1...5).randomElement()!.makeArray {
                            TableViewSectionModelImpl(
                                header: nil,
                                footer: nil,
                                cellModels: (1...20).randomElement()!.makeArray {
                                    TableViewCellPresenterExample.details()
                                }
                            )
                        }
                    )
                }
            }
        )
    }
    
}
