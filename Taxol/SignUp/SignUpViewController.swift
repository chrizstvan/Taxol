//
//  SignUpViewController.swift
//  Taxol
//
//  Created by Chris Stev on 23/07/20.
//  Copyright © 2020 chrizstvan. All rights reserved.
//

import UIKit

class SignUpViewController: BaseViewController {
        
    //MARK:- Properties
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Light", size: 36)
        label.text = "SIGN UP"
        label.textColor = UIColor(white: 1, alpha: 0.8)
        return label
    }()
    
    private let emailTextField: UITextField = {
        return UITextField().textField(placeholder: "Email", isSecure: false)
    }()
    
    private let passwordTextField: UITextField = {
        return UITextField().textField(placeholder: "Password", isSecure: true)
    }()
    
    private let fullNameTextField: UITextField = {
        return UITextField().textField(placeholder: "Full Name", isSecure: false)
    }()
    
    private lazy var emailContainerView: UIView = {
        let view = UITextField().inputContainerView(image: #imageLiteral(resourceName: "ic_mail_outline_white_2x"), textField: self.emailTextField)
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return view
    }()
    
    private lazy var nameContainerView: UIView = {
        let view = UITextField().inputContainerView(image: #imageLiteral(resourceName: "ic_person_outline_white_2x"), textField: self.fullNameTextField)
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return view
    }()
    
    private lazy var passwordContainerView: UIView = {
        let view = UIView().inputContainerView(image: #imageLiteral(resourceName: "ic_lock_outline_white_2x"), textField: self.passwordTextField)
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return view
    }()
    
    private let userSegment: UISegmentedControl = {
        let segment = UISegmentedControl(items: ["Rider", "Driver"])
        segment.backgroundColor = .backgroundColor
        segment.tintColor = UIColor(white: 1, alpha: 0.87)
        segment.selectedSegmentIndex = 0
        return segment
    }()
    
    private lazy var segmentContainerView: UIView = {
        let view = UIView().inputContainerView(image: #imageLiteral(resourceName: "ic_account_box_white_2x"), segment: userSegment)
        view.heightAnchor.constraint(equalToConstant: 80).isActive = true
        return view
    }()
    
    private let signupButton: AuthButton = {
        let button = AuthButton(type: .system)
        button.setTitle("Sign Up", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
        return button
    }()
    
    private lazy var inputStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [self.emailContainerView, self.nameContainerView, self.passwordContainerView, self.segmentContainerView, signupButton])
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.spacing = 24
        return stack
    }()
    
    private let dontHaveAccountButton: UIButton = {
        let button = UIButton(type: .system)
        let attributeTitle = NSMutableAttributedString(string: "Already have an account ?   ", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16), NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        
        attributeTitle.append(NSAttributedString(string: "Sign in", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16), NSAttributedString.Key.foregroundColor : UIColor.mainBlueTintColor]))
        //button.addTarget(self, action: #selector(handleShowSignUp), for: .touchUpInside)
        button.setAttributedTitle(attributeTitle, for: .normal)
        return button
    }()
    
    //MARK:- VIP Prop
    var interactor: SignUpInteractorPrototcol!
    
    //MARK:- Life Cycle
    deinit {
        print("deinit \(self)")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //configureNavBar(appering: .show)
    }
    

    //MARK:- Setup Layout
    private func setupView() {
        view.backgroundColor = .backgroundColor
        view.addSubview(titleLabel)
        titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 40)
        titleLabel.centerXTo(view: view)
        
        view.addSubview(inputStackView)
        inputStackView.centerXTo(view: view)
        inputStackView.anchor(top: titleLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 40, paddingLeft: 16, paddingRight: 16 )
        
        view.addSubview(dontHaveAccountButton)
        dontHaveAccountButton.centerXTo(view: view)
        dontHaveAccountButton.anchor(left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingLeft: 16, paddingBottom: 16, paddingRight: 16)
    }

    //MARK:- Selector / Action
    @objc func handleSignUp() {
        guard let email = emailTextField.text else { return }
        guard let fullname = fullNameTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        let userType = userSegment.selectedSegmentIndex > 0 ? "Driver" : "Rider"
        let request = SignUpModel.CreateUser.Request(userForm: SignUpModel.UserFormField(email: email, fullname: fullname, password: password, userType: userType))
        
        interactor.postSignUpData(request: request)
    }
}
