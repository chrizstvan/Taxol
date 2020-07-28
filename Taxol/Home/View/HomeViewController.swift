//
//  HomeViewController.swift
//  Taxol
//
//  Created by Chris Stev on 24/07/20.
//  Copyright © 2020 chrizstvan. All rights reserved.
//

import UIKit
import Firebase
import MapKit

protocol HomeViewProtocol: class {
    func userNotLogin(nav: UINavigationController)
    func loadUser(user: HomeModel.ViewModel)
}

class HomeViewController: BaseViewController {

    ///interactor
    var interactor: HomeInteractorProtocol!
    
    //let promptView = HomeView()
    let mapView = MKMapView()
    let inputActivationView = InputActivationView()
    let locationInputView = LocationInputView()
    let tableView = UITableView()
    
    //MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationController?.navigationBar.barStyle = .default
        configureView()
        //signOut()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavBar(appering: .hide)
        fetchUserDataFromService()
        fetchDriverNearBy()
    }
    
    //MARK:- Setup view
    private func configureView() {
        //view = promptView
        configureMapView()
        configureInputActivationView()
        configureTableView()
    }
    
    private func configureMapView() {
        view.addSubview(mapView)
        mapView.frame = view.frame
        interactor.chekLocationAuth()
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
    }
    
    private func configureInputActivationView() {
        inputActivationView.homeVC = self
        view.addSubview(inputActivationView)
        inputActivationView.centerXTo(view: view)
        inputActivationView.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 10 ,width: view.frame.width - 64, height: 50 )
        
    }
    
    func configureLocationInputView() {
        locationInputView.homeVC = self
        view.addSubview(locationInputView)
        locationInputView.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor, height: 200)
        locationInputView.alpha = 0
        
        UIView.animate(withDuration: 0.5, animations: {
            self.locationInputView.alpha = 1
        }) { (_) in
            self.inputActivationView.alpha = 0
            UIView.animate(withDuration: 0.3) {
                self.tableView.frame.origin.y = self.locationInputView.frame.height
            }
        }
    }
    
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(LocationCell.self, forCellReuseIdentifier: "LocationCell")
        tableView.rowHeight = 60
        tableView.tableFooterView = UIView()
        
        let locationInputViewHeight: CGFloat = view.frame.height - locationInputView.frame.height
        tableView.frame = CGRect(x: 0, y: view.frame.height , width: view.frame.width, height: locationInputViewHeight)
        
        view.addSubview(tableView)
    }
    
    func dismissLocationInputView() {
        UIView.animate(withDuration: 0.3, animations: {
            self.locationInputView.alpha = 0
            self.tableView.frame.origin.y = self.view.frame.height
        }) { (_) in
            self.locationInputView.removeFromSuperview()
            UIView.animate(withDuration: 0.3) {
                self.inputActivationView.alpha = 1
            }
        }
    }
        
    //MARK:- logout for test purposes
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            let nav = UINavigationController(rootViewController: LoginBuilder().build())
            nav.modalPresentationStyle = .fullScreen
            self.present(nav, animated: true, completion: nil)
        } catch {
            print("Error sign out")
        }
    }

}

extension HomeViewController: HomeViewProtocol {
    func userNotLogin(nav: UINavigationController) {
        self.present(nav, animated: true, completion: nil)
    }
    
    private func fetchUserDataFromService() {
        interactor.loginCheck()
    }
    
    private func fetchDriverNearBy() {
        interactor.getDriverData(radius: 50)
    }
    
    func loadUser(user: HomeModel.ViewModel) {
        //configureView()
        DispatchQueue.main.async {
            self.locationInputView.userVM = user
        }
    }
    
    
}
