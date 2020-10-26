//
//  TableViewSectionModel.swift
//  TableView
//
//  Created by Vadym Zhydenko on 23.10.2020.
//

import Foundation

protocol TableViewSectionModel {
    
    var headerModel: TableViewHeaderFooterViewModel? { get }
    var footerModel: TableViewHeaderFooterViewModel? { get }
    var cellModels: [TableViewCellModel] { get }
    
}

final class TableViewSectionModelImpl: TableViewSectionModel {
    
    let headerModel: TableViewHeaderFooterViewModel?
    let footerModel: TableViewHeaderFooterViewModel?
    let cellModels: [TableViewCellModel]
    
    init(
        headerModel: TableViewHeaderFooterViewModel? = nil,
        footerModel: TableViewHeaderFooterViewModel? = nil,
        cellModels: [TableViewCellModel]
    ) {
        self.headerModel = headerModel
        self.footerModel = footerModel
        self.cellModels = cellModels
    }
    
}
