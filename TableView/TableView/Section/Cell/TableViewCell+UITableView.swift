//
//  TableViewCell+UITableView.swift
//  TableView
//
//  Created by Vadym Zhydenko on 23.10.2020.
//

import UIKit

extension UITableView {
    
    func register(cellModel model: TableViewCellModel) {
        switch model.viewClass {
        case .nib(let viewClass):
            let nib = UINib(nibName: String(describing: viewClass), bundle: nil)
            register(nib, forCellReuseIdentifier: model.viewReuseIdentifier)
        case .anyClass(let viewClass):
            register(viewClass, forCellReuseIdentifier: model.viewReuseIdentifier)
        }
    }
    
    func dequeue(cellModel model: TableViewCellModel, for indexPath: IndexPath) -> TableViewCell {
        guard let cell = dequeueReusableCell(withIdentifier: model.viewReuseIdentifier, for: indexPath) as? TableViewCell else {
            register(cellModel: model)
            guard let cell = dequeueReusableCell(withIdentifier: model.viewReuseIdentifier, for: indexPath) as? TableViewCell else {
                fatalError("Could not dequeue cell with identifier: \(model.viewReuseIdentifier)")
            }
            return cell
        }
        return cell
    }
    
    func dequeueConfigured(cellModel model: TableViewCellModel, for indexPath: IndexPath) -> TableViewCell {
        let cell = dequeue(cellModel: model, for: indexPath)
        cell.configure(using: model)
        return cell
    }
    
}
