//
//  MapVC.swift
//  Bazaar
//
//  Created by AVIN on 2017-11-16.
//  Copyright © 2017 Syed Abbas. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapVC: UIViewController {
    
    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var pullUpView: UIView!
    
    @IBOutlet weak var pullUpViewHeightConstraint: NSLayoutConstraint!
    
    var locationManager = CLLocationManager()
    let authorizationStatus = CLLocationManager.authorizationStatus()
    let regionRadius: Double = 1000

    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        locationManager.delegate = self
        configureLocationServices()
        animateViewUp()
        addSwipeDown()
        addSwipeUp()
    }
    
    func animateViewUp(){
        pullUpViewHeightConstraint.constant = 380
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    
    func addSwipeUp(){
        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(animatedViewUp))
        swipe.direction = .up
        pullUpView.addGestureRecognizer(swipe)
    }
    
    func addSwipeDown(){
        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(animatedViewDown))
        swipe.direction = .down
        pullUpView.addGestureRecognizer(swipe)
    }
    
    @objc func animatedViewDown(){
        pullUpViewHeightConstraint.constant = 80
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func animatedViewUp(){
        pullUpViewHeightConstraint.constant = 450
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }

  
    @IBAction func centerMapBtnWasPressed(_ sender: Any) {
        if authorizationStatus == .authorizedAlways || authorizationStatus == .authorizedWhenInUse {
            centerMapOnUserLocation()
            mapView.showsUserLocation = true
        }
    }
    
}

extension MapVC: MKMapViewDelegate {
    
    func centerMapOnUserLocation() {
        guard let coordinate = locationManager.location?.coordinate else { return }
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(coordinate, regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
}

extension MapVC: CLLocationManagerDelegate {
    
    func configureLocationServices() {
        if authorizationStatus == .notDetermined {
            locationManager.requestAlwaysAuthorization()
        } else {
            return
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        centerMapOnUserLocation()
    }
    
}

//extension MapVC: UICollectionViewDelegate, 




