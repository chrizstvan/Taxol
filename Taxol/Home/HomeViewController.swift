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

class HomeViewController: BaseViewController {

    ///interactor
    var interactor: HomeInteractorProtocol!
    
    //let promptView = HomeView()
    let mapView = MKMapView()
    
    //MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        chekIfUserLoggedIn()
        //signOut()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavBar(appering: .hide)
    }
    
    //MARK:- Setup view
    func configureView() {
        //view = promptView
        configureMapView()
    }
    
    func configureMapView() {
        view.addSubview(mapView)
        mapView.frame = view.frame
        interactor.chekLocationAuth()
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
    }
    
    //MARK:- Chek login logout
    func chekIfUserLoggedIn() {
        if Auth.auth().currentUser?.uid == nil {
            let nav = UINavigationController(rootViewController: LoginBuilder().build())
            nav.modalPresentationStyle = .fullScreen
            self.present(nav, animated: true, completion: nil)
            
        } else {
            print("user id is : \(Auth.auth().currentUser?.uid)")
            configureView()
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print("Error sign out")
        }
    }

}
