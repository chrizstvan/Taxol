//
//  HomeInteractor.swift
//  Taxol
//
//  Created by Chris Stev on 25/07/20.
//  Copyright © 2020 chrizstvan. All rights reserved.
//

import Foundation
import Firebase
import MapKit

protocol HomeInteractorProtocol {
    func loginCheck()
    func chekLocationAuth()
    func getDriverData(mapView: MKMapView, radius: Double)
    func searchLocationBy(mapView: MKMapView, naturalLangQuery: SearchLocationModel.Request)
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
    
    func getDriverData(mapView: MKMapView,radius: Double) {
        guard let location = locationWorker.locationManager.location else { return }
        ServiceManager.fetchDriver(location: location, radius: radius) { (driver) in
            guard let coordinate = driver.location?.coordinate else { return }
            let annotation = DriverAnnotation(uid: driver.uid, coordinate: coordinate)
            
            var driverIsVisible: Bool {
                return mapView.annotations.contains { (driverAnno) -> Bool in
                    guard let mark = driverAnno as? DriverAnnotation else { return false }
                    if mark.uid == driver.uid {
                        self.presenter.updateDriverAnnotation(mapView: mapView, driverAnnotation: mark, updatedCoordinate: coordinate)
                        return true
                    }
                    return false
                }
            }
            
            if !driverIsVisible {
                self.presenter.getDriverAnnotation(mapView: mapView, annotation: annotation)
            }
        }
    }
    
    func searchLocationBy(mapView: MKMapView, naturalLangQuery: SearchLocationModel.Request) {
        var result = [MKPlacemark]()
        let request = MKLocalSearch.Request()
        request.region = mapView.region
        request.naturalLanguageQuery = naturalLangQuery.query
        
        let search = MKLocalSearch(request: request)
        search.start { (response, error) in
            if let _ = error {
                print("error search location by")
                return
            }
            
            guard let response = response else { return }
            response.mapItems.forEach { (item) in
                result.append(item.placemark)
            }
            self.presenter.didFoundLocation(response: SearchLocationModel.Response(placemarks: result))
        }
    }
    
}
