//
//  TableViewData.swift
//  TableView
//
//  Created by Vadym Zhydenko on 23.10.2020.
//

import UIKit

enum TableViewDataState {

    case normal(TableViewDataLoadMore)
    case loadingMore
    
    /// this case is ambiguous behaviour because if it's empty data you need to set `TableViewPlaceholderData`
//    case pullToRefresh
    
    var canLoadMore: Bool {
        guard case .normal(let loadMore) = self else { return false }
        return loadMore == .yes
    }

}

enum TableViewDataLoadMore {
    case yes
    case no
}

protocol TableViewData: UITableViewDataSource, UITableViewDelegate {
    
    var allowsSelection: Bool { get }
    var separatorStyle: UITableViewCell.SeparatorStyle { get }
    
    var header: UIView? { get }
    var footer: UIView? { get }
    var sectionModels: [TableViewSectionModel] { get }
    
    var state: TableViewDataState { get }
    var onLoadMore: ((TableViewData, @escaping ([TableViewSectionModel]?) -> Void) -> Void)? { get }
    func beginLoadMore(_ tableView: UITableView)
    func endLoadMore(_ tableView: UITableView, sectionModels: [TableViewSectionModel]?)
    
    func config(for tableView: UITableView)
    
}

extension TableViewData {
    
    func prepare(for tableView: UITableView) {
        config(for: tableView)
        registerSubviews(for: tableView)
        tableView.allowsSelection = allowsSelection
        tableView.separatorStyle = separatorStyle
        tableView.separatorInset = .init(top: 0, left: 16, bottom: 0, right: 16)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
    }
    
    func registerSubviews(for tableView: UITableView) {
        tableView.tableHeaderView = header
        tableView.tableFooterView = footer
        sectionModels.compactMap { $0.header }.forEach { tableView.register(headerFooterViewModel: $0) }
        sectionModels.compactMap { $0.footer }.forEach { tableView.register(headerFooterViewModel: $0) }
        sectionModels.compactMap { $0.cellModels }.forEach { $0.forEach { tableView.register(cellModel: $0) } }
    }
    
}

extension TableViewData {
    
    var allowsSelection: Bool { true }
    var separatorStyle: UITableViewCell.SeparatorStyle { .singleLine }
    
    var header: UIView? { nil }
    var footer: UIView? { nil }
    
    var state: TableViewDataState { .normal(.no) }
    var onLoadMore: ((TableViewData, @escaping ([TableViewSectionModel]?) -> Void) -> Void)? { nil }
    func beginLoadMore(_ tableView: UITableView) { }
    func endLoadMore(_ tableView: UITableView, sectionModels: [TableViewSectionModel]?) { }
    
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
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let onLoadMore = onLoadMore,
            indexPath.section == sectionModels.count - 1,
            indexPath.row == sectionModels[indexPath.section].cellModels.count - 1,
            state.canLoadMore
            else { return }
        
        beginLoadMore(tableView)
        
        onLoadMore(self) { [weak tableView, weak self] sections in
            guard let tableView = tableView else { return }
            self?.endLoadMore(tableView, sectionModels: sections)
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let model = sectionModels[section].header else { return nil }
        return tableView.dequeueConfigured(headerFooterViewModel: model)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        sectionModels[section].header?.viewHeight.value ?? 0
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        guard let model = sectionModels[section].footer else { return nil }
        return tableView.dequeueConfigured(headerFooterViewModel: model)
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        sectionModels[section].footer?.viewHeight.value ?? 0
    }
    
}
 
