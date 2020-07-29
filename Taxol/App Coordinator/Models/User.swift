//
//  User.swift
//  Taxol
//
//  Created by Chris Stev on 27/07/20.
//  Copyright © 2020 chrizstvan. All rights reserved.
//

import Foundation
import CoreLocation

struct User {
    let uid: String
    let fullname: String
    let email: String
    let userType: String
    var location: CLLocation?
    
    init(uid: String, firebase: [String: Any]) {
        self.uid = uid
        fullname = firebase["Fullname"] as? String ?? ""
        email = firebase["email"] as? String ?? ""
        userType = firebase["userType"] as? String ?? ""
    }
}
