//
//  HomeInteractor.swift
//  Taxol
//
//  Created by Chris Stev on 25/07/20.
//  Copyright © 2020 chrizstvan. All rights reserved.
//

import Foundation
import Firebase

protocol HomeInteractorProtocol {
    func loginCheck()
    func chekLocationAuth()
    func getDriverData(radius: Double)
}

final class HomeInteractor: HomeInteractorProtocol {
    
    var locationWorker: LocationWorker!
    var presenter: HomePresenterProtocol!
    
    func loginCheck() {
        if Auth.auth().currentUser?.uid == nil {
            let nav = UINavigationController(rootViewController: LoginBuilder().build())
            nav.modalPresentationStyle = .fullScreen
            presenter.userNotLogin(nav: nav)
        } else {
            //prsenter configure
            getUserData()
        }
    }
    
    func chekLocationAuth() {
        locationWorker.enableLocationServices()
    }
    
    func getUserData() {
        guard let currentUID = Auth.auth().currentUser?.uid else { return }
        ServiceManager.fetchUserData(uid: currentUID) { (user) in
            let response = HomeModel.Response(user: user)
            self.presenter.didLoadUserData(user: response)
        }
    }
    
    func getDriverData(radius: Double) {
        guard let location = locationWorker.locationManager.location else { return }
        ServiceManager.fetchDriver(location: location, radius: radius) { (user) in
            print("driver is \(user.fullname)")
        }
    }
    
}
