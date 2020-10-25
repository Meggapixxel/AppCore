//
//  Utils.swift
//  TableView
//
//  Created by Vadym Zhydenko on 24.10.2020.
//

import UIKit

extension CGFloat {
    
    static func random() -> CGFloat {
        CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
    
}

extension UIColor {
    
    static func random() -> UIColor {
        UIColor(
           red:   .random(),
           green: .random(),
           blue:  .random(),
           alpha: 1.0
        )
    }
    
}

extension String {
    
    static func random(maxLength: Int) -> String {
        let length = (0...maxLength).randomElement()!
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0..<length).map{ _ in letters.randomElement()! })
    }
    
}

extension Int {
    
    func makeArray<T>(_ closure: () -> T) -> [T] {
        (0..<self).compactMap { _ in closure() }
    }
    
}
