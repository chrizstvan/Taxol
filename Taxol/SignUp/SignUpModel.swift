//
//  SignUpModel.swift
//  Taxol
//
//  Created by Chris Stev on 25/07/20.
//  Copyright © 2020 chrizstvan. All rights reserved.
//

import Foundation

enum SignUpModel {
    struct UserFormField {
        var email: String
        var fullname: String
        var password: String
        var userType: String
    }
    
    enum CreateUser {
        struct Request {
            var userForm: UserFormField
        }
        struct Response {
            //User?
        }
        struct ViewModel {
            //var user: User?
        }
    }
}
