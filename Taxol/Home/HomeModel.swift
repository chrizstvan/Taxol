//
//  HomeModel.swift
//  Taxol
//
//  Created by Chris Stev on 28/07/20.
//  Copyright © 2020 chrizstvan. All rights reserved.
//

import Foundation
import MapKit

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

enum SearchLocationModel {
    struct Request {
        var query: String
    }
    struct Response {
        var placemarks: [MKPlacemark]
    }
    struct ViewModel {
        let title: String
        let subtitle: String
        
        init(placemark: MKPlacemark) {
            self.title = placemark.name ?? ""
            self.subtitle = placemark.address ?? ""
        }
    }
}
