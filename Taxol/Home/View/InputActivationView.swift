//
//  InputActivationView.swift
//  Taxol
//
//  Created by Chris Stev on 26/07/20.
//  Copyright © 2020 chrizstvan. All rights reserved.
//

import UIKit

class InputActivationView: BaseView {
    
    private let indicatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    private let placeholderLabel: UILabel = {
        let label = UILabel()
        label.text = "Where to?"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .darkGray
        return label
    }()

    override func createSubView() {
        backgroundColor = .white
        addShadow()
        
        addSubview(indicatorView)
        indicatorView.centerYTo(view: self, leftAnchor: self.leftAnchor, leftPadding: 16)
        indicatorView.anchor(width: 6, height: 6)
        indicatorView.layer.cornerRadius = 6 / 2
        
        addSubview(placeholderLabel)
        placeholderLabel.centerYTo(view: self, leftAnchor: indicatorView.rightAnchor, leftPadding: 20)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        addGestureRecognizer(tap)
    }
    
    var homeVC: HomeViewController?
    @objc func handleTap() {
        homeVC?.configureLocationInputView()
    }

}
