//
//  TableViewSectionModel.swift
//  TableView
//
//  Created by Vadym Zhydenko on 23.10.2020.
//

import Foundation

public protocol TableViewSectionModel {
    
    var headerModel: TableViewHeaderFooterViewModel? { get }
    var footerModel: TableViewHeaderFooterViewModel? { get }
    var cellModels: [TableViewCellModel] { get }
    
}

public final class TableViewSectionModelImpl: TableViewSectionModel {
    
    public let headerModel: TableViewHeaderFooterViewModel?
    public let footerModel: TableViewHeaderFooterViewModel?
    public let cellModels: [TableViewCellModel]
    
    public init(
        headerModel: TableViewHeaderFooterViewModel? = nil,
        footerModel: TableViewHeaderFooterViewModel? = nil,
        cellModels: [TableViewCellModel]
    ) {
        self.headerModel = headerModel
        self.footerModel = footerModel
        self.cellModels = cellModels
    }
    
}
