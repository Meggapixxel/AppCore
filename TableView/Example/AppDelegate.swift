//
//  AppDelegate.swift
//  TableView
//
//  Created by Vadym Zhydenko on 23.10.2020.
//

import UIKit
import AppCore

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private let coordinatorsFactory = CoordinatorsFactoryImpl()
    private let deeplinkNavigator: DeeplinkNavigator = DeeplinkNavigatorImpl(deeplinks: [DeeplinkExample.self])
    private var appCoordinator: Coordinator!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        appCoordinator = coordinatorsFactory.app(window: window)
        appCoordinator.start()
        
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        deeplinkNavigator.handle(deeplinkUrl: url, in: appCoordinator)
    }

}
