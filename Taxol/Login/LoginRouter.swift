//
//  LoginRouter.swift
//  Taxol
//
//  Created by Chris Stev on 23/07/20.
//  Copyright © 2020 chrizstvan. All rights reserved.
//

import UIKit

final class LoginRouter {
    
    /// The navigation controller to use for navigation.
    weak var navigationController: UINavigationController?
    
    //MARK:- Navigate to Sign Up
    func routeToSignUp() {
        let vc = SignUpBuilder().build()
        navigationController?.pushViewController(vc, animated: true)
    }
}
