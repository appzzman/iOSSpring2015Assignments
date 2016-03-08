//
//  ViewController.swift
//  UWFMap
//
//  Created by Janusz Chudzynski on 2/23/15.
//  Copyright (c) 2015 Janusz Chudzynski. All rights reserved.
//



import UIKit
// Add import statements for frameworks
import MapKit
import CoreLocation


//TODO: Add declaration that indicates that this class is MKMapViewDelegate conformant
class ViewController: UIViewController{

    //TODO: connect an iBOutlet 
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    var locationManager = CLLocationManager()
    var locationsModel = MyLocationsManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.segmentedControl.selectedSegmentIndex = UISegmentedControlNoSegment
        
        //TODO: set the delegate of the map view here

        //TODO: enable showing user's location
        self.mapView.showsUserLocation = true

        //TODO:request authorization YOU MUST ALSO Make changes to Info.plist file!
        self.locationManager.requestWhenInUseAuthorization()
    }
    
    
   //TODO: Finish implementation of method that will show user's current location
   @IBAction func showCurrentLocation(){
    var cl2d = CLLocationCoordinate2D(latitude: self.mapView.userLocation.coordinate.latitude, longitude: self.mapView.userLocation.coordinate.longitude)
    var span = MKCoordinateSpan(latitudeDelta: 0.0007872, longitudeDelta: 0.0109863)

    //TODO:create a instance of the region
    var newRegion:MKCoordinateRegion// MKCoordinateRegion = MKCoordinateRegion(center: cl2d, span: span)
    
    //TODO: change the displayed region of the map
    
    }
    
    
    
    @IBAction func segmentedControlChanged(sender: AnyObject) {
        let index =  sender.selectedSegmentIndex
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
        
       //TODO:Create a MKPointAnnotation
        let annotation: MKPointAnnotation = MKPointAnnotation()

        //TODO: and set it's coordinate using coordinate property 

        
        self.zoomOnLocation(annotation.coordinate)
        annotation.title = location.title

        //TODO: Add annotation to the map

    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    func zoomOnLocation(location:CLLocationCoordinate2D){
        let span = MKCoordinateSpan(latitudeDelta: 10.907872, longitudeDelta: 10.9109863)
        let newRegion: MKCoordinateRegion = MKCoordinateRegion(center: location, span: span)
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
            mp!.canShowCallout = true
            let b: UIButton = UIButton(type: UIButtonType.DetailDisclosure) as UIButton
            mp!.rightCalloutAccessoryView = b
            
        }
        mp!.annotation = annotation
        
        return mp
    }
    
    

    func mapView(mapView: MKMapView!, annotationView view: MKAnnotationView!, calloutAccessoryControlTapped control: UIControl!) {
        
        var filteredArray = self.locationsModel.locations.filter( { (location: Location) -> Bool in
            if let title = view.annotation?.title{
                return location.title == title
            }
            return false

        })
        
        if filteredArray.count > 0
        {
          //  self.performSegueWithIdentifier("showMap", sender: self)
            let mp = self.storyboard!.instantiateViewControllerWithIdentifier("MapViewController") as! MapViewController
        
            mp.location = filteredArray[0]
            self.navigationController?.pushViewController(mp, animated: true)
        }
    }
}










