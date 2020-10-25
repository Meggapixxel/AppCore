//
//  TableViewSingleSectionDataImpl.swift
//  TableView
//
//  Created by Vadym Zhydenko on 23.10.2020.
//

import UIKit

class TableViewSingleSectionDataImpl: NSObject, TableViewData {
    
    let header: UIView?
    let footer: UIView?
    var sectionModels: [TableViewSectionModel] {
        [
            TableViewSectionModelImpl(header: sectionHeaderModel, footer: sectionFooterModel, cellModels: cellModels)
        ]
    }
    
    private let sectionHeaderModel: TableViewHeaderFooterViewModel?
    private let sectionFooterModel: TableViewHeaderFooterViewModel?
    private(set) var cellModels: [TableViewCellModel]
    
    let onLoadMore: ((TableViewData, @escaping ([TableViewSectionModel]?) -> Void) -> Void)?
    private(set) var state: TableViewDataState = .normal(.yes)
    
    init(
        header: UIView? = nil,
        footer: UIView? = nil,
        sectionHeaderModel: TableViewHeaderFooterViewModel? = nil,
        sectionFooterModel: TableViewHeaderFooterViewModel? = nil,
        cellModels: [TableViewCellModel],
        onLoadMore: ((TableViewData, @escaping ([TableViewSectionModel]?) -> Void) -> Void)? = nil
    ) {
        self.header = header
        self.footer = footer
        self.sectionHeaderModel = sectionHeaderModel
        self.sectionFooterModel = sectionFooterModel
        self.cellModels = cellModels
        self.onLoadMore = onLoadMore
        
        let canLoadMore: TableViewDataLoadMore = onLoadMore == nil ? .no : .yes
        state = .normal(canLoadMore)
        
        super.init()
    }
    
    func beginLoadMore(_ tableView: UITableView) {
        state = .loadingMore
        tableView.tableFooterView = UIView.loadingFooterView(width: tableView.bounds.size.width, height: 44)
    }
    
    func endLoadMore(_ tableView: UITableView, sectionModels: [TableViewSectionModel]?) {
        tableView.beginUpdates()
        tableView.tableFooterView = nil

        let state: TableViewDataState
        defer {
            tableView.endUpdates()
            self.state = state
        }
        
        guard let cellModels = sectionModels?.compactMap { $0.cellModels }.joined() else { return state = .normal(.no) }
        
        let oldCellModelsCount = cellModels.count
        self.cellModels.append(contentsOf: cellModels)
        
        registerSubviews(for: tableView)
        
        let newCellModelsCount = oldCellModelsCount + cellModels.count
        let insertRows = stride(from: oldCellModelsCount, to: newCellModelsCount, by: 1)
        let insertIndexPathes = insertRows.compactMap { IndexPath(row: $0, section: 0) }
        tableView.insertRows(at: insertIndexPathes, with: .automatic)
        state = .normal(.yes)
    }
    
    final func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    final func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cellModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.dequeueConfigured(cellModel: cellModels[indexPath.row], for: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        cellModels[indexPath.row].viewHeight.value
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard case .some(let closure) = cellModels[indexPath.row].selection else { return }
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
        guard let model = sectionHeaderModel else { return nil }
        return tableView.dequeueConfigured(headerFooterViewModel: model)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        sectionHeaderModel?.viewHeight.value ?? 0
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        guard let model = sectionFooterModel else { return nil }
        return tableView.dequeueConfigured(headerFooterViewModel: model)
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        sectionFooterModel?.viewHeight.value ?? 0
    }
    
}
