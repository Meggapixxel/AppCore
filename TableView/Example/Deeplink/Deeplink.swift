//
//  Deeplink.swift
//  TableView
//
//  Created by Vadym Zhydenko on 27.10.2020.
//

import Foundation

protocol Deeplink {
    
    static func canHandle(host: String, parameters: [String: String]?) -> Bool
    static func execute(in coordinator: Coordinator, host: String, parameters: [String: String]?)
    
}
