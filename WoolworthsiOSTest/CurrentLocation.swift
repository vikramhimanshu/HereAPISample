//
//  CurrentLocation.swift
//  WoolworthsiOSTest
//
//  Created by Tantia, H. on 28/02/2017.
//  Copyright © 2017 Kreativ Apps, LLC. All rights reserved.
//

import CoreLocation

class CurrentLocation : NSObject, CLLocationManagerDelegate {
    
    typealias completionSuccess = (_ coordinates: CLLocationCoordinate2D) -> Void
    typealias completionFailure = (_ status:CLAuthorizationStatus, _ error: NSError?) -> Void

    public var status: CLAuthorizationStatus {
        return CLLocationManager.authorizationStatus()
    }
    
    private var manager: CLLocationManager
    private lazy var fallBackLocation: CLLocation = CLLocation(latitude: -33.865143, longitude: 151.209900)
    private var location: CLLocationCoordinate2D? {
        didSet (old) {
            if (location?.latitude != old?.latitude) &&
                (location?.longitude != old?.longitude) {
                if let loc = location {
                    successHandler?(loc)
                }
            }
        }
    }
    
    
    private var successHandler: completionSuccess!
    private var failureHandler: completionFailure!
    
    override init() {
        manager = CLLocationManager()
        super.init()
        
        manager.pausesLocationUpdatesAutomatically = true
        manager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        manager.delegate = self
    }
    
    deinit {
        successHandler = nil
        failureHandler = nil
        manager.stopUpdatingLocation()
        manager.stopMonitoringSignificantLocationChanges()
    }
    
    func requestAuthorizationIfNeeded(completionBlock: @escaping completionFailure) {
        failureHandler = completionBlock
        if CLLocationManager.authorizationStatus() == .notDetermined ||
           CLLocationManager.authorizationStatus() == .denied {
            manager.requestWhenInUseAuthorization()
        }
    }
    
    func get(withCompletionBlock: @escaping completionSuccess, and failureBlock: @escaping completionFailure) {
        successHandler = withCompletionBlock
        failureHandler = failureBlock
        manager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        let err = error as NSError
        switch err.code {
        case 0:
            break
        default:
            failureHandler!(CLLocationManager.authorizationStatus(), err)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let latestLocation = locations.last {
            location = latestLocation.coordinate
            manager.stopUpdatingLocation()
        }
    }
        
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .denied, .restricted:
            manager.stopUpdatingLocation()
            failureHandler?(status, nil)
        case .authorizedAlways, .authorizedWhenInUse:
            failureHandler?(status, nil)
        case .notDetermined:
            manager.stopUpdatingLocation()
            failureHandler?(status, nil)
        }
    }
}
