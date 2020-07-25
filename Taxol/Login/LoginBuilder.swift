//
//  LoginBuilder.swift
//  Taxol
//
//  Created by Chris Stev on 23/07/20.
//  Copyright © 2020 chrizstvan. All rights reserved.
//

import UIKit

final class LoginBuilder {
    
    func build() -> UIViewController {
        let view = buildView()
        let router = buildRouter()
        let interactor = buildInteractor()
        let presenter = buildPresenter()
        view.promptView.interactor = interactor
        view.promptView.router = router
        interactor.presenter = presenter
        presenter.view = view
        return view
    }
    
    //MARK:- View
    private func buildView() -> LoginViewController {
        return LoginViewController()
    }
    
    //MARK:- Interactor
    private func buildInteractor() -> LoginIntractor {
        return LoginIntractor()
    }
    
    //MARK:- Presenter
    private func buildPresenter() -> LoginPresenter {
        return LoginPresenter()
    }
    
    //MARK:- Router
    private func buildRouter() -> LoginRouter {
        return LoginRouter()
    }
}
