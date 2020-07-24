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
    func postSignUpData(email: String, fullName: String, password: String, userIndex: Int)
}

final class SignUpInteractor: SignUpInteractorPrototcol {
    
    var presenter: SignUpPresenterProtocol!
    
    func postSignUpData(email: String, fullName: String, password: String, userIndex: Int) {
        
        let userType = userIndex > 0 ? "Driver" : "Rider"
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if let error = error {
                print("Failed to register user \(error)")
                return
            }
            
            guard let uid = result?.user.uid else { return }
            
            let value = ["email": email, "Fullname": fullName, "userType": userType]
            
            Database.database().reference().child("users").child(uid).updateChildValues(value) { (error, ref) in
                self.presenter.didUpdateDataBase()
            }
        }
    }
}
