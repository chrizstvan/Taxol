//
//  SignUpViewController+ViewProtocol.swift
//  Taxol
//
//  Created by Chris Stev on 25/07/20.
//  Copyright © 2020 chrizstvan. All rights reserved.
//

import Foundation

protocol SignUpViewProtocol: class {
    func successSignUp()
    func failedSignUp(error: Error?)
}

extension SignUpViewController: SignUpViewProtocol {
    func successSignUp() {
        print("success sign up")
        self.dismiss(animated: true, completion: nil)
    }
    
    func failedSignUp(error: Error?) {
        print(error?.localizedDescription as Any)
    }
    
    
}
