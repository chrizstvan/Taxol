//
//  LocationInputView.swift
//  Taxol
//
//  Created by Chris Stev on 27/07/20.
//  Copyright © 2020 chrizstvan. All rights reserved.
//

import UIKit

class LocationInputView: BaseView {
    
    ///view model
    var userVM: HomeModel.ViewModel? {
        didSet {
            guard let user = userVM else { return }
            titleLabel.text = user.fullname
            
        }
    }

    private let backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "baseline_arrow_back_black_36dp-1").withRenderingMode(.alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(handleBackButton), for: .touchUpInside)
        return button
    }()
    
    private let titleLabel: UILabel = {
       let title = UILabel()
        title.text = "Chris Stevens"
        title.textColor = .darkGray
        title.font = UIFont.systemFont(ofSize: 16)
        return title
    }()
    
    private let startLocationIndicatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    private let linkView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    private let destinationIndicatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    private lazy var startingLocationTextField: UITextField = {
       let tf = UITextField()
        tf.placeholder = "Current Location"
        tf.backgroundColor = .groupTableViewBackground
        tf.isEnabled = false
        tf.font = UIFont.systemFont(ofSize: 14)
        return tf
    }()
    
    private lazy var destinationLocationTextField: UITextField = {
       let tf = UITextField()
        tf.placeholder = "Enter a destination.."
        tf.backgroundColor = .lightGray
        tf.returnKeyType = .search
        tf.font = UIFont.systemFont(ofSize: 14)
        return tf
    }()

    override func createSubView() {
        super.createSubView()
        backgroundColor = .white
        addShadow()
        
        addSubview(backButton)
        backButton.anchor(top: topAnchor, left: leftAnchor, paddingTop: 44, paddingLeft: 12,
                          width: 24, height: 25)
        
        addSubview(titleLabel)
        titleLabel.centerYTo(view: backButton)
        titleLabel.centerXTo(view: self)
        
        addSubview(startingLocationTextField)
        startingLocationTextField.anchor(top: backButton.bottomAnchor, left: leftAnchor, right: rightAnchor,
                                         paddingTop: 4, paddingLeft: 40, paddingRight: 40, height: 30)
        
        addSubview(destinationLocationTextField)
        destinationLocationTextField.anchor(top: startingLocationTextField.bottomAnchor, left: leftAnchor, right: rightAnchor,
                                            paddingTop: 12, paddingLeft: 40, paddingRight: 40, height: 30)
        
        addSubview(startLocationIndicatorView)
        startLocationIndicatorView.centerYTo(view: startingLocationTextField, leftAnchor: leftAnchor, leftPadding: 20)
        startLocationIndicatorView.anchor(width: 6, height: 6)
        startLocationIndicatorView.layer.cornerRadius = 6 / 2
        
        addSubview(destinationIndicatorView)
        destinationIndicatorView.centerYTo(view: destinationLocationTextField, leftAnchor: leftAnchor, leftPadding: 20)
        destinationIndicatorView.anchor(width: 6, height: 6)
        destinationIndicatorView.layer.cornerRadius = 6 / 2
        
        addSubview(linkView)
        linkView.centerXTo(view: startLocationIndicatorView)
        linkView.anchor(top: startLocationIndicatorView.bottomAnchor,
                        bottom: destinationIndicatorView.topAnchor,
                        paddingTop: 4, paddingBottom: 4, width: 0.5)
    }
    
    //MARK:- Action / Selector
    var homeVC: HomeViewController?
    @objc func handleBackButton() {
        homeVC?.dismissLocationInputView()
    }
        
}
