//
//  TableViewLoadingData.swift
//  TableView
//
//  Created by Vadym Zhydenko on 23.10.2020.
//

import UIKit

final class TableViewLoadingData: NSObject, TableViewData {

    var allowsSelection: Bool { false }
    var separatorStyle: UITableViewCell.SeparatorStyle { .none }
    
    let header: UIView?
    let footer: UIView?
    var sectionModels: [TableViewSectionModel] { [] }
    
    let height: TableViewSubviewHeight
    let indicatorStyle: UIActivityIndicatorView.Style
    
    init(
        header: UIView? = nil,
        footer: UIView? = .init(),
        height: TableViewSubviewHeight = .fill,
        indicatorStyle: UIActivityIndicatorView.Style = .default
    ) {
        self.header = header
        self.footer = footer
        self.height = height
        self.indicatorStyle = indicatorStyle
        super.init()
    }
    
    final func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    final func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    final func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        let activityIndicator: UIActivityIndicatorView
        if #available(iOS 13.0, *) {
            activityIndicator = UIActivityIndicatorView(style: indicatorStyle)
        } else {
            activityIndicator = UIActivityIndicatorView(style: indicatorStyle)
        }
        
        cell.contentView.addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: cell.contentView.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: cell.contentView.centerYAnchor)
        ])
        activityIndicator.startAnimating()
        
        return cell
    }
    
    final func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        height.value
    }
    
    final func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    final func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
    }
    
    final func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        nil
    }
    
    final func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        0
    }
    
    final func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        nil
    }
    
    final func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        0
    }
    
}

extension UIActivityIndicatorView.Style {
    
    static var `default`: UIActivityIndicatorView.Style {
        if #available(iOS 13.0, *) {
            return .medium
        } else {
            return .gray
        }
    }
    
}
