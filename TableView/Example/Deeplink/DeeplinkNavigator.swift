//
//  DeeplinkNavigator.swift
//  TableView
//
//  Created by Vadym Zhydenko on 27.10.2020.
//

import Foundation

protocol DeeplinkNavigator {
    
    func handle(deeplinkUrl url: URL, in coordinator: Coordinator) -> Bool
    
}

final class DeeplinkNavigatorImpl {
    
    private let deeplinks: [Deeplink.Type]
    
    init(deeplinks: [Deeplink.Type]) {
        self.deeplinks = deeplinks
    }
    
}

extension DeeplinkNavigatorImpl: DeeplinkNavigator {
    
    func handle(deeplinkUrl url: URL, in coordinator: Coordinator) -> Bool {
        guard let host = url.host else {
            return false
        }
        let parameters = url.queryParameters
        
        guard let deeplink = deeplinks.first(where: { $0.canHandle(host: host, parameters: parameters) }) else {
            return false
        }
        deeplink.execute(in: coordinator, host: host, parameters: parameters)
        return true
    }
    
}

private extension URL {
    
    var queryParameters: [String: String]? {
        guard let components = URLComponents(url: self, resolvingAgainstBaseURL: true),
            let queryItems = components.queryItems
            else { return nil }
        return queryItems.reduce(into: [String: String]()) { (result, item) in
            guard let value = item.value else { return }
            result[item.name] = value
        }
    }
    
}
