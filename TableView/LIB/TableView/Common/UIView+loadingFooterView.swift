//
//  UIView+loadingFooterView.swift
//  TableView
//
//  Created by Vadym Zhydenko on 24.10.2020.
//

import UIKit

extension UIView {

    static func loadingFooterView(width: CGFloat, height: CGFloat) -> UIView {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        footerView.backgroundColor = .white

        let activityIndicator = UIActivityIndicatorView(style: .gray)
        footerView.addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            activityIndicator.centerYAnchor.constraint(equalTo: footerView.centerYAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: footerView.centerXAnchor)
        ])
        activityIndicator.startAnimating()

        return footerView
    }

}
