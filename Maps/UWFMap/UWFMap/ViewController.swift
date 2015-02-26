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
    var annotations = [MKPointAnnotation]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//TODO: set the delegate of the map view here
        self.mapView.delegate = self

//TODO: enable showing user's location
        self.mapView.showsUserLocation = true
        self.locationManager.requestWhenInUseAuthorization()
        
    }
    
    @IBAction func segmentedControlChanged(sender: AnyObject) {
        self.addAnnotations()
        
    }
    
    
    func mapView(mapView: MKMapView!, regionDidChangeAnimated animated: Bool)
    {
        println("changed")
    }
    
    func addAnnotations(){
      
        var annotation: MKPointAnnotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: 52.233, longitude: 21.0167)
        
        var annotation2: MKPointAnnotation = MKPointAnnotation()
        annotation2.coordinate = CLLocationCoordinate2D(latitude: 42.233, longitude: 11.0167)
        
        self.zoomOnLocation(annotation.coordinate)
        
        annotation.title = "Warsaw"
        annotation2.title = "Test"
 
        // annotation.
        self.annotations.append(annotation)
        self.annotations.append(annotation2)
        self.mapView.addAnnotation(annotation)
        self.mapView.addAnnotation(annotation2)
      
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func zoomOnLocation(location:CLLocationCoordinate2D){
        var span = MKCoordinateSpan(latitudeDelta: 0.0107872, longitudeDelta: 0.0909863)
        var newRegion: MKCoordinateRegion = MKCoordinateRegion(center: location, span: span)
         self.mapView.setRegion(newRegion, animated: true)
    }
    
    
//TODO: Finish implementation of method that will show user's current location
   @IBAction func showCurrentLocation(){
    var cl2d = CLLocationCoordinate2D(latitude: self.mapView.userLocation.coordinate.latitude, longitude: self.mapView.userLocation.coordinate.longitude)

    var span = MKCoordinateSpan(latitudeDelta: 0.0007872, longitudeDelta: 0.0109863)
    var newRegion: MKCoordinateRegion = MKCoordinateRegion(center: cl2d, span: span)
    self.mapView.setRegion(newRegion, animated: true)
    
    }
    
    func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView!{
        if annotation is MKUserLocation {
            //return nil so map view draws "blue dot" for standard user location
            return nil
        }
        
        
        let reuseid = "pinid"
    
        var mp = mapView.dequeueReusableAnnotationViewWithIdentifier(reuseid)

        if mp == nil {
            mp = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseid)
            mp.canShowCallout = true
            var b: UIButton = UIButton.buttonWithType(UIButtonType.DetailDisclosure) as UIButton
            mp.rightCalloutAccessoryView = b
            
        }
        mp.annotation = annotation
        
        return mp
    }
    
    
        
}










