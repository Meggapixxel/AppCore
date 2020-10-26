//
//  ViewController.swift
//  TableView
//
//  Created by Vadym Zhydenko on 25.10.2020.
//

import UIKit

protocol ViewController: UIViewController {
    
    var viewControllerPresenter: ViewControllerPresenter! { get }
    
}
