//
//  HomeBuilder.swift
//  Taxol
//
//  Created by Chris Stev on 25/07/20.
//  Copyright © 2020 chrizstvan. All rights reserved.
//

import UIKit

final class HomeBuilder {
    
    func build() -> UIViewController {
        let view = buildView()
        let interactor = buildInteractor()
        let locationWorker = buildLocationWorker()
        let presenter = buildPresenter()
        
        view.interactor = interactor
        interactor.locationWorker = locationWorker
        interactor.presenter = presenter
        presenter.view = view
        
        return view
    }
    
    //MARK:- View
    private func buildView() -> HomeViewController {
        return HomeViewController()
    }
    
    //MARK:- Interactor
    private func buildInteractor() -> HomeInteractor {
        return HomeInteractor()
    }
    
    //MARK:- Presenter
    private func buildPresenter() -> HomePresenter {
        return HomePresenter()
    }
    
    //MARK:- Worker
    private func buildLocationWorker() -> LocationWorker {
        return LocationWorker.shared
    }
}
