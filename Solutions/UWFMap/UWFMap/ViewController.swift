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
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    var locationManager = CLLocationManager()
    var locationsModel = MyLocationsManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.segmentedControl.selectedSegmentIndex = UISegmentedControlNoSegment
        
//TODO: set the delegate of the map view here
        self.mapView.delegate = self

//TODO: enable showing user's location
        self.mapView.showsUserLocation = true
        self.locationManager.requestWhenInUseAuthorization()

        
        
    }
    
    @IBAction func segmentedControlChanged(sender: AnyObject) {
      var index =  sender.selectedSegmentIndex
        if(index<self.locationsModel.locations.count){
             self.addAnnotation(self.locationsModel.locations[index])
        }
        else{
            let alert = UIAlertView()
            alert.title = "Alert"
            alert.message = "You need to add this city to the locations model class"
            alert.addButtonWithTitle("Understod")
            alert.show()
            
        }

    }
    
    

    func addAnnotation(location:Location){
     
        var annotation: MKPointAnnotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: location.latitude , longitude: location.longitude)
        
        self.zoomOnLocation(annotation.coordinate)
        annotation.title = location.title
        self.mapView.addAnnotation(annotation)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func zoomOnLocation(location:CLLocationCoordinate2D){
        var span = MKCoordinateSpan(latitudeDelta: 10.907872, longitudeDelta: 10.9109863)
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
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        }
    
    func mapView(mapView: MKMapView!, annotationView view: MKAnnotationView!, calloutAccessoryControlTapped control: UIControl!) {
        
        var filteredArray = self.locationsModel.locations.filter( { (location: Location) -> Bool in
            return location.title == view.annotation.title
        })
        
        if filteredArray.count > 0
        {
          //  self.performSegueWithIdentifier("showMap", sender: self)
            var mp = self.storyboard!.instantiateViewControllerWithIdentifier("MapViewController") as MapViewController
        
            mp.location = filteredArray[0]
            self.navigationController?.pushViewController(mp, animated: true)
        }
    }
}










