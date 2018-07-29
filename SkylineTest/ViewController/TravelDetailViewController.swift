//
//  TravelDetailViewController.swift
//  SkylineTest
//
//  Created by apple on 2018/7/22.
//  Copyright © 2018年 Johnny. All rights reserved.
//

import UIKit
import MapKit

class TravelDetailViewController: UIViewController{
    
    var travelDetail: Travel?
    
    let locationManager = CLLocationManager()
   
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestLocationAccess()
        setUp()
        self.navigationItem.title = travelDetail?.stitle
        // Do any additional setup after loading the view.
    }
   
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        locationManager.stopUpdatingLocation()
    }
    
    func requestLocationAccess() {
        let status = CLLocationManager.authorizationStatus()
        
        switch status {
        case .authorizedAlways, .authorizedWhenInUse:
            return
            
        case .denied, .restricted:
            print("location access denied")
            
        default:
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    private func setUp() {
        locationManager.startUpdatingLocation()
        locationManager.distanceFilter = kCLLocationAccuracyNearestTenMeters
        locationManager.desiredAccuracy = kCLLocationAccuracyBest

        if CLLocationManager.isMonitoringAvailable(for: CLCircularRegion.self) {
            let coordinate = CLLocationCoordinate2DMake(travelDetail?.latitude.toDouble() ?? 0.0, travelDetail?.longitude.toDouble() ?? 0.0)
            
            // 創建大頭釘(annotation)
            let travelAnnotation = MKPointAnnotation()
            travelAnnotation.coordinate = coordinate
            travelAnnotation.title = travelDetail?.stitle
            travelAnnotation.subtitle = "靠近\(travelDetail?.MRT ?? "")捷運站"

            let scaleRegion = MKCoordinateRegion(center: coordinate, span:  MKCoordinateSpan(latitudeDelta: 0.3, longitudeDelta: 0.3))
            mapView.setRegion(scaleRegion, animated: true)
            mapView.addAnnotation(travelAnnotation)
 
        }
        else {
            print("System can't track regions")
        }
    }
}
