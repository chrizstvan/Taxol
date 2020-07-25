//
//  HomeInteractor.swift
//  Taxol
//
//  Created by Chris Stev on 25/07/20.
//  Copyright © 2020 chrizstvan. All rights reserved.
//

import Foundation

protocol HomeInteractorProtocol {
    func chekLocationAuth()
}

final class HomeInteractor: HomeInteractorProtocol {
    
    var locationWorker: LocationWorker!
    
    func chekLocationAuth() {
        locationWorker.enableLocationServices()
    }
}
