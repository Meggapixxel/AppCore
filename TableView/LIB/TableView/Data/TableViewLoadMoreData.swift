//
//  TableViewLoadMoreData.swift
//  TableView
//
//  Created by Vadym Zhydenko on 25.10.2020.
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

protocol TableViewLoadMoreData: TableViewData {
    
    var state: TableViewDataState { get }
    var onLoadMore: (TableViewData, @escaping ([TableViewSectionModel]?) -> Void) -> Void { get }
    func beginLoadMore(_ tableView: UITableView) -> Bool
    func endLoadMore(_ tableView: UITableView, sectionModels: [TableViewSectionModel]?)
    
}


extension TableViewLoadMoreData {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard indexPath.section == sectionModels.count - 1,
            indexPath.row == sectionModels[indexPath.section].cellModels.count - 1,
            state.canLoadMore
            else { return }
        
        guard beginLoadMore(tableView) else { return }
        
        onLoadMore(self) { [weak tableView, weak self] sections in
            guard let tableView = tableView else { return }
            self?.endLoadMore(tableView, sectionModels: sections)
        }
    }
    
}
