//
//  SignUpInteractor.swift
//  Taxol
//
//  Created by Chris Stev on 24/07/20.
//  Copyright © 2020 chrizstvan. All rights reserved.
//

import Foundation
import Firebase

protocol SignUpInteractorPrototcol {
    func postSignUpData(request: SignUpModel.CreateUser.Request)
}

final class SignUpInteractor: SignUpInteractorPrototcol {
    
    var presenter: SignUpPresenterProtocol!
    
    func postSignUpData(request: SignUpModel.CreateUser.Request) {
        Auth.auth().createUser(withEmail: request.userForm.email, password: request.userForm.password) { (result, error) in
            if let error = error {
                self.presenter.didFailedUpdateDataBase(error: error)
                return
            }
            
            guard let uid = result?.user.uid else { return }
            
            let value = ["email": request.userForm.email,
                         "Fullname": request.userForm.fullname,
                         "userType": request.userForm.userType]
            
            Database.database().reference().child("users").child(uid).updateChildValues(value) { (error, ref) in
                self.presenter.didUpdateDataBase()
            }
        }
    }
}
