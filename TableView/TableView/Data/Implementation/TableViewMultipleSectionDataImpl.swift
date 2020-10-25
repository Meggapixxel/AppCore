//
//  TableViewMultipleSectionDataImpl.swift
//  TableView
//
//  Created by Vadym Zhydenko on 23.10.2020.
//

import UIKit

class TableViewMultipleSectionDataImpl: NSObject, TableViewData {
    
    let header: UIView?
    let footer: UIView?
    private(set) var sectionModels: [TableViewSectionModel]
    
    let onLoadMore: ((TableViewData, @escaping ([TableViewSectionModel]?) -> Void) -> Void)?
    private(set) var state: TableViewDataState
    
    init(
        header: UIView? = nil,
        footer: UIView? = nil,
        sectionModels: [TableViewSectionModel],
        onLoadMore: ((TableViewData, @escaping ([TableViewSectionModel]?) -> Void) -> Void)? = nil
    ) {
        self.header = header
        self.footer = footer
        self.sectionModels = sectionModels
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

        guard let sectionModels = sectionModels else { return state = .normal(.no) }
        
        let oldSectionsCount = sectionModels.count
        self.sectionModels.append(contentsOf: sectionModels)
        
        registerSubviews(for: tableView)

        let newSectionsCount = oldSectionsCount + sectionModels.count
        let insertSections = stride(from: oldSectionsCount, to: newSectionsCount, by: 1)
        let insertIndexSet = IndexSet(insertSections)
        tableView.insertSections(insertIndexSet, with: .automatic)
        
        state = .normal(.yes)
    }
    
    final func numberOfSections(in tableView: UITableView) -> Int {
        sectionModels.count
    }
    
    final func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
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
