//
//  ViewController.swift
//  TableView
//
//  Created by Vadym Zhydenko on 25.10.2020.
//

import UIKit

public protocol ViewController: UIViewController {
    
    var viewControllerPresenter: ViewControllerPresenter! { get }
    
}
