//
//  LoginView.swift
//  Taxol
//
//  Created by Chris Stev on 23/07/20.
//  Copyright © 2020 chrizstvan. All rights reserved.
//

import UIKit

final class LoginView: BaseView {
   
    
    //MARK:- Properties
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Light", size: 36)
        label.text = "TAXOL"
        label.textColor = UIColor(white: 1, alpha: 0.8)
        return label
    }()
    
    private let emailTextField: UITextField = {
        return UITextField().textField(placeholder: "Email", isSecure: false)
    }()
    
    private let passwordTextField: UITextField = {
        return UITextField().textField(placeholder: "Password", isSecure: true)
    }()
    
    private lazy var emailContainerView: UIView = {
        let view = UITextField().inputContainerView(image: #imageLiteral(resourceName: "ic_mail_outline_white_2x"), textField: self.emailTextField)
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return view
    }()
    
    private lazy var passwordContainerView: UIView = {
        let view = UIView().inputContainerView(image: #imageLiteral(resourceName: "ic_lock_outline_white_2x"), textField: self.passwordTextField)
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return view
    }()
    
    private let loginButton: AuthButton = {
        let button = AuthButton(type: .system)
        button.setTitle("Logi in", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        return button
    }()
    
    private lazy var inputStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [self.emailContainerView, self.passwordContainerView, loginButton])
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 24
        return stack
    }()
    
    private let dontHaveAccountButton: UIButton = {
        let button = UIButton(type: .system)
        let attributeTitle = NSMutableAttributedString(string: "Don't have an account ?   ", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16), NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        
        attributeTitle.append(NSAttributedString(string: "Sign Up", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16), NSAttributedString.Key.foregroundColor : UIColor.mainBlueTintColor]))
        button.addTarget(self, action: #selector(handleShowSignUp), for: .touchUpInside)
        button.setAttributedTitle(attributeTitle, for: .normal)
        return button
    }()
    
    override func createSubView() {
        backgroundColor = UIColor.backgroundColor
        addSubview(titleLabel)
        titleLabel.anchor(top: safeAreaLayoutGuide.topAnchor, paddingTop: 40)
        titleLabel.centerXTo(view: self)
        
        addSubview(inputStackView)
        inputStackView.centerXTo(view: self)
        inputStackView.anchor(top: titleLabel.bottomAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 40, paddingLeft: 16, paddingRight: 16 )
        
        addSubview(dontHaveAccountButton)
        dontHaveAccountButton.centerXTo(view: self)
        dontHaveAccountButton.anchor(left: leftAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, right: rightAnchor, paddingLeft: 16, paddingBottom: 16, paddingRight: 16)
    }
    
    //MARK:- Action / Selector Button
    var router: LoginRouter!
    
    @objc func handleShowSignUp() {
        router.routeToSignUp()
    }
}
