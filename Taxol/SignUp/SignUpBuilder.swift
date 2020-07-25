//
//  SignUpBuilder.swift
//  Taxol
//
//  Created by Chris Stev on 24/07/20.
//  Copyright © 2020 chrizstvan. All rights reserved.
//

import UIKit

final class SignUpBuilder {
    
    func build() -> UIViewController {
        let view = buildView()
        let interactor = buildInterctor()
        let presenter = buildPresenter()
        
        view.interactor = interactor
        interactor.presenter = presenter
        presenter.view = view
        
        return view
    }
    
    //MARK:- View
    private func buildView() -> SignUpViewController {
        return SignUpViewController()
    }
    
    //MARK:- Interactor
    private func buildInterctor() -> SignUpInteractor {
        return SignUpInteractor()
    }
    
    //MARK:- Presenter
    private func buildPresenter() -> SignUpPresenter {
        return SignUpPresenter()
    }
}
