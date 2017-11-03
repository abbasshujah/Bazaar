//
//  LocationService.swift
//  Bazaar
//
//  Created by AVIN on 2017-11-03.
//  Copyright © 2017 Syed Abbas. All rights reserved.
//

import CoreLocation
import Foundation

class LocationService: NSObject, CLLocationManagerDelegate{
    
    let locationManager = CLLocationManager()
    
    
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
            print("Latitude: \(location.coordinate.latitude),  Longitude: \(location.coordinate.longitude)")
        }
    }
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
        
    }
    
    
    
}
