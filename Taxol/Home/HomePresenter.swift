//
//  HomePresenter.swift
//  Taxol
//
//  Created by Chris Stev on 25/07/20.
//  Copyright © 2020 chrizstvan. All rights reserved.
//

import UIKit
import MapKit

protocol HomePresenterProtocol {
    func userNotLogin(nav: UINavigationController)
    func didLoadUserData(user: HomeModel.Response)
    func getDriverAnnotation(mapView: MKMapView, annotation: DriverAnnotation)
    func updateDriverAnnotation(mapView: MKMapView, driverAnnotation: DriverAnnotation, updatedCoordinate: CLLocationCoordinate2D)
}

final class HomePresenter: HomePresenterProtocol {
    
    weak var view: HomeViewProtocol?
    
    func didLoadUserData(user: HomeModel.Response) {
        view?.loadUser(user: HomeModel.ViewModel(user: user))
    }
    
    func userNotLogin(nav: UINavigationController) {
        view?.userNotLogin(nav: nav)
    }
    
    func getDriverAnnotation(mapView: MKMapView, annotation: DriverAnnotation) {
        mapView.addAnnotation(annotation)
        view?.showingDriverAnnotation(mapView: mapView)
    }
    
    func updateDriverAnnotation(mapView: MKMapView, driverAnnotation: DriverAnnotation, updatedCoordinate: CLLocationCoordinate2D) {
        driverAnnotation.updateAnnotationPosition(withCoordinate: updatedCoordinate)
        
    }
}
