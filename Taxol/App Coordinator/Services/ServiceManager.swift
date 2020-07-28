//
//  ServiceManager.swift
//  Taxol
//
//  Created by Chris Stev on 27/07/20.
//  Copyright © 2020 chrizstvan. All rights reserved.
//

import Foundation
import Firebase
import CoreLocation
import GeoFire

let ServiceManager = Service.shared
let DB_REF = Database.database().reference()
let REF_USERS = DB_REF.child("users")
let REF_DRIVER_LOCATION = DB_REF.child("driver-locations")

struct Service {
    
    static let shared = Service()
    
    func fetchUserData(uid: String, completion: @escaping(User) -> Void) {
        
        REF_USERS.child(uid).observeSingleEvent(of: .value) { (snapshot) in
            guard let dictionary = snapshot.value as? [String: Any] else { return }
            let user = User(firebase: dictionary)
            completion(user)
        }
    }
    
    func fetchDriver(location: CLLocation, radius: Double, completion: @escaping(User) -> Void) {
        let geofire = GeoFire(firebaseRef: REF_DRIVER_LOCATION)
        let myQuery = geofire.query(at: location, withRadius: radius)
        
        REF_DRIVER_LOCATION.observe(.value) { (snapshot) in
            myQuery.observe(.keyEntered, with: { (uid, location) in
                self.fetchUserData(uid: uid) { (user) in
                    var driver = user
                    driver.location = location
                    completion(driver)
                }
            })
        }
    }
}
