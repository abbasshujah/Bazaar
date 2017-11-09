//
//  LocationService.swift
//  Bazaar
//
//  Created by AVIN on 2017-11-03.
//  Copyright © 2017 Syed Abbas. All rights reserved.
//

import CoreLocation
import Foundation

class LocationService: NSObject, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    var currentLocation: CLLocation!

    override init(){
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startMonitoringSignificantLocationChanges()
        
        locationAuthStatus()
     
    }
    
    func locationAuthStatus() {
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            currentLocation = locationManager.location
            Location.sharedInstance.latitude = currentLocation.coordinate.latitude
            Location.sharedInstance.longitude = currentLocation.coordinate.longitude
            
        }else {
            locationManager.requestWhenInUseAuthorization()
            locationAuthStatus()
        }
    }
    
    
}


/*
 let locationManager = CLLocationManager()
 //static let instance = LocationService()
 var latitide: Double?
 var longitude: Double?
 
 func initLocationManager(){
 
 locationManager.delegate = self
 locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
 locationManager.requestWhenInUseAuthorization()
 locationManager.startUpdatingLocation()
 
 }
 
 
 func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
 let location = locations[locations.count - 1]
 if location.horizontalAccuracy > 0 {
 locationManager.stopUpdatingLocation()
 //print("Latitude: \(location.coordinate.latitude),  Longitude: \(location.coordinate.longitude)")
 latitide = location.coordinate.latitude
 longitude = location.coordinate.longitude
 }
 }
 
 func getLatitude() -> Double {
 print("Lattitte from serv \(latitide)")
 return self.latitide!
 
 }
 
 
 func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
 print(error)
 
 }
 
 */


