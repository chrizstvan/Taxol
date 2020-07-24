//
//  LoginViewController.swift
//  Taxol
//
//  Created by Chris Stev on 23/07/20.
//  Copyright © 2020 chrizstvan. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {
    
    let promptView = LoginView()

    //MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupView()        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavBar(appering: .hide)
    }
    
    
    //MARK:- Setup layout
    func setupView() {
        view = promptView
        view.backgroundColor = .backgroundColor
        promptView.router.navigationController = navigationController
        
    }
}

