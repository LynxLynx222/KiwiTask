//
//  LocationManager.swift
//  KiwiTask
//
//  Created by Ondrej Andrysek on 7/3/18.
//  Copyright © 2018 cz.oa. All rights reserved.
//

import Foundation
import CoreLocation

class LocationManager:NSObject, CLLocationManagerDelegate{
    
    let manager = CLLocationManager()
    var getDataDelegate: GetDataDelegate?
    var previousStatus = CLLocationManager.authorizationStatus()
    override init(){
        super.init()
        manager.delegate = self
    }
    
    //MARK: if status changes from not determined to anything else, get flight data
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if previousStatus == .notDetermined && CLLocationManager.authorizationStatus() != .notDetermined{
            getDataDelegate?.getFlightData()
        }
    }
    
    func getStatus() -> CLAuthorizationStatus{
       let status = CLLocationManager.authorizationStatus()
        return status
    }
    
}
