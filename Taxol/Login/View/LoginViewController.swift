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
    
    ///Router
    var router: LoginRouter!

    //MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view = promptView
        promptView.delegate = self
        // Do any additional setup after loading the view.
        setupView()
    }
    
    
    //MARK:- Setup layout
    func setupView() {
        view.backgroundColor = .backgroundColor
        router.navigationController = navigationController
        configureNavBar(appering: .hide)
    }
}

extension LoginViewController: ButtonDidTapped {
    func didTapped() {
        router.routeToSignUp()
    }
    
    
}
