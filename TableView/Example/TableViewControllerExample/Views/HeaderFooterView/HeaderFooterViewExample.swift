//
//  HeaderFooterViewExample.swift
//  TableView
//
//  Created by Vadym Zhydenko on 25.10.2020.
//

import UIKit

final class HeaderFooterViewExample: UITableViewHeaderFooterView {
    
    private let label = UILabel()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    @discardableResult func config(model: HeaderFooterViewExampleModel) -> HeaderFooterViewExample {
        label.text = model.text
        return self
    }
    
}

extension HeaderFooterViewExample: TableViewHeaderFooterView {
    
    @discardableResult func configure(using model: TableViewHeaderFooterViewModel) -> Self {
        guard let model = model as? HeaderFooterViewExampleModel else { return self }
        config(model: model)
        return self
    }
    
}

private extension HeaderFooterViewExample {
    
    struct LocalConstants {
        static var leading: CGFloat { 16 }
        static var trailing: CGFloat { 16 }
        static var top: CGFloat { 24 }
        static var bottom: CGFloat { 8 }
        static var font: UIFont { UIFont.boldSystemFont(ofSize: 17) }
        static var textColor: UIColor { .blue }
    }
    
    func commonInit() {
        contentView.backgroundColor = .white
        contentView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: LocalConstants.leading),
            contentView.trailingAnchor.constraint(equalTo: label.trailingAnchor, constant: LocalConstants.trailing),
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: LocalConstants.top),
            contentView.bottomAnchor.constraint(equalTo: label.bottomAnchor, constant: LocalConstants.bottom)
        ])
        label.font = LocalConstants.font
        label.textColor = LocalConstants.textColor
    }
    
}
