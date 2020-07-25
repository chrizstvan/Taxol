//
//  LoginInteractor.swift
//  Taxol
//
//  Created by Chris Stev on 24/07/20.
//  Copyright © 2020 chrizstvan. All rights reserved.
//

import Foundation
import Firebase

protocol LoginInteractorProtocol {
    func login(request: LoginModel.Request)
}

final class LoginIntractor: LoginInteractorProtocol {
    
    var presenter: LoginPresenterProtocol!
    
    func login(request: LoginModel.Request) {
        Auth.auth().signIn(withEmail: request.loginForm.email, password: request.loginForm.password) { (result, error) in
            if let error = error {
                self.presenter.failedLogin(msg: error)
                return
            }
            
            self.presenter.successLogin()
        }
    }
}
