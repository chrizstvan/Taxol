//
//  HomePresenter.swift
//  Taxol
//
//  Created by Chris Stev on 25/07/20.
//  Copyright © 2020 chrizstvan. All rights reserved.
//

import UIKit

protocol HomePresenterProtocol {
    func userNotLogin(nav: UINavigationController)
    func didLoadUserData(user: HomeModel.Response)
}

final class HomePresenter: HomePresenterProtocol {
    
    weak var view: HomeViewProtocol?
    
    func didLoadUserData(user: HomeModel.Response) {
        view?.loadUser(user: HomeModel.ViewModel(user: user))
    }
    
    func userNotLogin(nav: UINavigationController) {
        view?.userNotLogin(nav: nav)
    }
    
}
