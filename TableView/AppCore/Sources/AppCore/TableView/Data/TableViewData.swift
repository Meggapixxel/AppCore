//
//  TableViewData.swift
//  TableView
//
//  Created by Vadym Zhydenko on 23.10.2020.
//

import UIKit

public protocol TableViewData: UITableViewDataSource, UITableViewDelegate {
    
    var allowsSelection: Bool { get }
    var separatorStyle: UITableViewCell.SeparatorStyle { get }
    
    var header: UIView? { get }
    var footer: UIView? { get }
    var sectionModels: [TableViewSectionModel] { get }
    
    func config(for tableView: UITableView)
    
}

public extension TableViewData {
    
    func prepare(for tableView: UITableView) {
        config(for: tableView)
        tableView.tableHeaderView = header
        tableView.tableFooterView = footer
        tableView.allowsSelection = allowsSelection
        tableView.separatorStyle = separatorStyle
        tableView.separatorInset = .init(top: 0, left: 16, bottom: 0, right: 16)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
    }
    
}

public extension TableViewData {
    
    var allowsSelection: Bool { true }
    var separatorStyle: UITableViewCell.SeparatorStyle { .singleLine }
    
    var header: UIView? { nil }
    var footer: UIView? { nil }
    
    func config(for tableView: UITableView) {
        
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
 
