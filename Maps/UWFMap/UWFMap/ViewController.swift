//
//  ViewController.swift
//  UWFMap
//
//  Created by Janusz Chudzynski on 2/23/15.
//  Copyright (c) 2015 Janusz Chudzynski. All rights reserved.
//

import UIKit
//TODO: Add import statements for frameworks
import MapKit
import CoreLocation
//TODO: Add declaration that indicates that this class is MKMapViewDelegate conformant
class ViewController: UIViewController, MKMapViewDelegate {
//TODO: add an iBOutlet for the mapview ( connect it with Storyboard)
    @IBOutlet weak var mapView: MKMapView!
    var locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
//TODO: set the delegate of the map view here
        self.mapView.delegate = self

//TODO: enable showing user's location
        self.mapView.showsUserLocation = true
        self.locationManager.requestWhenInUseAuthorization()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//TODO: Finish implementation of method that will show user's current location
    
    
}

