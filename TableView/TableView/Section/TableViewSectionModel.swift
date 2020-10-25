//
//  TableViewSectionModel.swift
//  TableView
//
//  Created by Vadym Zhydenko on 23.10.2020.
//

import Foundation

protocol TableViewSectionModel {
    var header: TableViewHeaderFooterViewModel? { get }
    var footer: TableViewHeaderFooterViewModel? { get }
    var cellModels: [TableViewCellModel] { get }
}

struct TableViewSectionModelImpl: TableViewSectionModel {
    let header: TableViewHeaderFooterViewModel?
    let footer: TableViewHeaderFooterViewModel?
    let cellModels: [TableViewCellModel]
}
