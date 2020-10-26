//
//  TableViewDataImpl.swift
//  TableView
//
//  Created by Vadym Zhydenko on 23.10.2020.
//

import UIKit

class TableViewDataImpl: NSObject, TableViewData {
    
    let header: UIView?
    let footer: UIView?
    let sectionModels: [TableViewSectionModel]

    init(
        header: UIView? = nil,
        footer: UIView? = nil,
        sectionModels: [TableViewSectionModel]
    ) {
        self.header = header
        self.footer = footer
        self.sectionModels = sectionModels
        
        super.init()
    }
    
    convenience init(
        header: UIView? = nil,
        footer: UIView? = .init(),
        sectionHeaderModel: TableViewHeaderFooterViewModel? = nil,
        sectionFooterModel: TableViewHeaderFooterViewModel? = nil,
        cellModels: [TableViewCellModel]
    ) {
        self.init(
            header: header,
            footer: footer,
            sectionModels: [
                TableViewSectionModelImpl(
                    headerModel: sectionHeaderModel,
                    footerModel: sectionFooterModel,
                    cellModels: cellModels
                )
            ]
        )
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        sectionModels.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sectionModels[section].cellModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.dequeueConfigured(cellModel: sectionModels[indexPath.section].cellModels[indexPath.row], for: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        sectionModels[indexPath.section].cellModels[indexPath.row].viewHeight.value
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard case .some(let closure) = sectionModels[indexPath.section].cellModels[indexPath.row].selection else { return }
        closure()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let model = sectionModels[section].headerModel else { return nil }
        return tableView.dequeueConfigured(headerFooterViewModel: model)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        sectionModels[section].headerModel?.viewHeight.value ?? 0
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        guard let model = sectionModels[section].footerModel else { return nil }
        return tableView.dequeueConfigured(headerFooterViewModel: model)
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        sectionModels[section].footerModel?.viewHeight.value ?? 0
    }
    
}
