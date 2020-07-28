//
//  SignUpInteractor.swift
//  Taxol
//
//  Created by Chris Stev on 24/07/20.
//  Copyright © 2020 chrizstvan. All rights reserved.
//

import Foundation
import Firebase
import GeoFire

protocol SignUpInteractorPrototcol {
    func postSignUpData(request: SignUpModel.CreateUser.Request)
}

final class SignUpInteractor: SignUpInteractorPrototcol {
    
    var presenter: SignUpPresenterProtocol!
    var locationWorker = LocationWorker.shared.locationManager.location
    
    private func uploadUserData(_ uid: String, _ request: SignUpModel.CreateUser.Request) {
        let value = ["email": request.userForm.email,
                     "Fullname": request.userForm.fullname,
                     "userType": request.userForm.userType]
        
        REF_USERS.child(uid).updateChildValues(value) { (error, ref) in
            self.presenter.didUpdateDataBase()
        }
    }
    
    func postSignUpData(request: SignUpModel.CreateUser.Request) {
        Auth.auth().createUser(withEmail: request.userForm.email, password: request.userForm.password) { (result, error) in
            if let error = error {
                self.presenter.didFailedUpdateDataBase(error: error)
                return
            }
            
            guard let uid = result?.user.uid else { return }
            
            //driver sign up
            if request.userForm.userType == "Driver" {
                let gofire = GeoFire(firebaseRef: REF_DRIVER_LOCATION)
                guard let location = self.locationWorker else { return }
                gofire.setLocation(location, forKey: uid) { (error) in
                    self.uploadUserData(uid, request)
                }
            } else {
                self.uploadUserData(uid, request)
            }
        }
    }
}
