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
}

final class SignUpPresenter: SignUpPresenterProtocol {
    
    func didUpdateDataBase() {
        print("success to update database...")
    }
    
}
