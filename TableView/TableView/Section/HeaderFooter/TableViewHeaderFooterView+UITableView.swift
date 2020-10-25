//
//  TableViewHeaderFooterView+UITableView.swift
//  TableView
//
//  Created by Vadym Zhydenko on 23.10.2020.
//

import UIKit

extension UITableView {
    
    func register(headerFooterViewModel model: TableViewHeaderFooterViewModel) {
        switch model.viewClass {
        case .nib(let viewClass):
            let nib = UINib(nibName: String(describing: viewClass), bundle: nil)
            register(nib, forHeaderFooterViewReuseIdentifier: model.viewReuseIdentifier)
        case .anyClass(let viewClass):
            register(viewClass, forHeaderFooterViewReuseIdentifier: model.viewReuseIdentifier)
        }
    }
    
    func dequeue(headerFooterViewModel model: TableViewHeaderFooterViewModel) -> TableViewHeaderFooterView {
        guard let headerFooterView = dequeueReusableHeaderFooterView(withIdentifier: model.viewReuseIdentifier) as? TableViewHeaderFooterView else {
            register(headerFooterViewModel: model)
            guard let headerFooterView = dequeueReusableHeaderFooterView(withIdentifier: model.viewReuseIdentifier) as? TableViewHeaderFooterView else {
                fatalError("Could not dequeue header/footer with identifier: \(model.viewReuseIdentifier)")
            }
            return headerFooterView
        }
        return headerFooterView
    }
    
    func dequeueConfigured(headerFooterViewModel model: TableViewHeaderFooterViewModel) -> TableViewHeaderFooterView {
        let headerFooterView = dequeue(headerFooterViewModel: model)
        headerFooterView.configure(using: model)
        return headerFooterView
    }
    
}
