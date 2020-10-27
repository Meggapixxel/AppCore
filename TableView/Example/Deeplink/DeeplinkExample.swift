//
//  DeeplinkExample.swift
//  TableView
//
//  Created by Vadym Zhydenko on 27.10.2020.
//

import Foundation
import AppCore

protocol DeeplinkExampleDelegate {
    
    func example(id: String)
    
}

final class DeeplinkExample: Deeplink {
    
    static func canHandle(host: String, parameters: [String: String]?) -> Bool {
        host == "example"
    }
    
    static func execute(in coordinator: Coordinator, host: String, parameters: [String: String]?) {
        guard let delegate = coordinator as? DeeplinkExampleDelegate else {
            fatalError("EmailConfirmDeepLink coordinator not AppCoordinator")
        }
        guard let id = parameters?["id"] else {
            fatalError("EmailConfirmDeepLink can't get 'ref' value")
        }
        delegate.example(id: id)
    }
    
}
