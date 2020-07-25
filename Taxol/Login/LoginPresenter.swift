//
//  LoginPresenter.swift
//  Taxol
//
//  Created by Chris Stev on 25/07/20.
//  Copyright © 2020 chrizstvan. All rights reserved.
//

import Foundation

protocol LoginPresenterProtocol {
    func successLogin()
    func failedLogin(msg: Error?)
}

final class LoginPresenter: LoginPresenterProtocol {
    
    weak var view: LoginViewProtocol?
    
    func successLogin() {
        view?.displaySuccess()
    }
    
    func failedLogin(msg: Error?) {
        view?.displayFailed(msg: msg)
    }
    
    
}
