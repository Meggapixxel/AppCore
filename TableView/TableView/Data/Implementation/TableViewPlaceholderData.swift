//
//  TableViewPlaceholderData.swift
//  TableView
//
//  Created by Vadym Zhydenko on 25.10.2020.
//

import UIKit

final class TableViewPlaceholderData: NSObject, TableViewData {

    var allowsSelection: Bool { false }
    var separatorStyle: UITableViewCell.SeparatorStyle { .none }
    
    let header: UIView?
    let footer: UIView?
    var sectionModels: [TableViewSectionModel] { [] }
    
    let attributedText: NSAttributedString
    
    init(
        header: UIView? = nil,
        footer: UIView? = nil,
        attributedText: NSAttributedString
    ) {
        self.header = header
        self.footer = footer
        self.attributedText = attributedText
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
        
        let label = UILabel()
        cell.contentView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor),
            cell.contentView.trailingAnchor.constraint(equalTo: label.trailingAnchor),
            label.centerYAnchor.constraint(equalTo: cell.contentView.centerYAnchor)
        ])
        label.textAlignment = .center
        label.attributedText = attributedText
        
        return cell
    }
    
    final func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        tableView.bounds.size.height
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
