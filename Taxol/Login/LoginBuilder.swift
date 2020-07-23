//
//  LoginBuilder.swift
//  Taxol
//
//  Created by Chris Stev on 23/07/20.
//  Copyright © 2020 chrizstvan. All rights reserved.
//

import UIKit

final class LoginBuilder {
    
    func build() -> UIViewController {
        let view = buildView()
        let router = buildRouter()
        view.router = router
        return view
    }
    
    //MARK:- View
    private func buildView() -> LoginViewController {
        return LoginViewController()
    }
    
    //MARK:- Router
    private func buildRouter() -> LoginRouter {
        return LoginRouter()
    }
}
