//
//  SignUpPresenter.swift
//  Taxol
//
//  Created by Chris Stev on 24/07/20.
//  Copyright © 2020 chrizstvan. All rights reserved.
//

import Foundation

protocol SignUpPresenterProtocol {
    func didUpdateDataBase()
    func didFailedUpdateDataBase(error: Error?)
}

final class SignUpPresenter: SignUpPresenterProtocol {
    
    weak var view: SignUpViewProtocol?
    
    func didFailedUpdateDataBase(error: Error?) {
        view?.failedSignUp(error: error)
    }
    
    func didUpdateDataBase() {
        view?.successSignUp()
    }
    
}
