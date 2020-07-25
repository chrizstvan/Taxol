//
//  HomeView.swift
//  Taxol
//
//  Created by Chris Stev on 25/07/20.
//  Copyright © 2020 chrizstvan. All rights reserved.
//

import UIKit
import MapKit

class HomeView: BaseView {
    
    let mapView = MKMapView()

    override func createSubView() {
        super.createSubView()
        addSubview(mapView)
        mapView.frame = self.frame
    }

}
