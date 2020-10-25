//
//  TableViewCellExample.swift
//  TableView
//
//  Created by Vadym Zhydenko on 24.10.2020.
//

import UIKit

final class TableViewCellExample: UITableViewCell {

    @IBOutlet private weak var titleLabel: UILabel!
    
}

extension TableViewCellExample: TableViewCell {
    
    @discardableResult func configure(using model: TableViewCellModel) -> Self {
        guard let model = model as? TableViewCellPresenterExample else { return self }
        switch model.selection {
        case .none: selectionStyle = .none
        case .some: selectionStyle = .blue
        }
        contentView.backgroundColor = model.color
        titleLabel.text = model.text
        titleLabel.textAlignment = model.textAlignment
        return self
    }
    
}

final class TableViewCellPresenterExample: TableViewCellModel {
    
    var viewClass: TableViewCellClass { .nib(TableViewCellExample.self) }
    let selection: TableViewCellModelSelection
    
    let color: UIColor
    let text: String
    let textAlignment: NSTextAlignment
    
    init(
        color: UIColor,
        text: String,
        textAlignment: NSTextAlignment,
        selection: TableViewCellModelSelection
    ) {
        self.color = color
        self.text = text
        self.textAlignment = textAlignment
        self.selection = selection
    }
    
}

extension TableViewCellPresenterExample {
    
    static func list(text: String, selection: @escaping () -> Void) -> TableViewCellPresenterExample {
        TableViewCellPresenterExample(
            color: .white,
            text: text,
            textAlignment: .center,
            selection: .some(selection)
        )
    }
    
    static func details() -> TableViewCellPresenterExample {
        TableViewCellPresenterExample(
            color: .random(),
            text: .random(maxLength: 200),
            textAlignment: .left,
            selection: .none
        )
    }
    
}
