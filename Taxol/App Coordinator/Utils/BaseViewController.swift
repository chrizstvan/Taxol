//
//  BaseViewController.swift
//  Taxol
//
//  Created by Chris Stev on 23/07/20.
//  Copyright © 2020 chrizstvan. All rights reserved.
//

import UIKit

enum NavigationBarAppearence {
    case show, hide
}

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barStyle = .black
        
        // Do any additional setup after loading the view.
    }
    
    func configureNavBar(appering setting: NavigationBarAppearence) {
        switch setting {
            case .show:
                navigationController?.navigationBar.isHidden = false
            case .hide:
                navigationController?.navigationBar.isHidden = true
        }
    }
}
