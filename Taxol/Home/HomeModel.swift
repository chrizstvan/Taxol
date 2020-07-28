//
//  HomeModel.swift
//  Taxol
//
//  Created by Chris Stev on 28/07/20.
//  Copyright © 2020 chrizstvan. All rights reserved.
//

import Foundation

enum HomeModel {
    struct Request {
        // empty
    }
    struct Response {
        var user: User
    }
    struct ViewModel {
        let fullname: String
        let email: String
        let userType: String
        
        init(user: Response) {
            fullname = user.user.fullname
            email = user.user.email
            userType = user.user.userType
        }
    }
}
