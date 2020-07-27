//
//  LoginModel.swift
//  Taxol
//
//  Created by Chris Stev on 25/07/20.
//  Copyright © 2020 chrizstvan. All rights reserved.
//

import Foundation

enum LoginModel {
    struct LoginForm {
        var email: String
        var password: String
    }
    struct Request {
        var loginForm: LoginForm
    }    
    struct Response {
        //User?
    }
}
