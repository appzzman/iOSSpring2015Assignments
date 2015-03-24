//
//  ViewController.swift
//  iBeacon
//
//  Created by Janusz Chudzynski on 3/23/15.
//  Copyright (c) 2015 Janusz Chudzynski. All rights reserved.

/*



//to create an instance use a following method:


    Steps:
    Enable location services (add keys to info.plist)

    Register beacons that you want to monitor using the  jmcBeaconManager.registerRegionWithProximityId method
   

    iBeacons available in the classroom:

    DEVICE ID	ALIAS	PROXIMITY UUID	MAJOR	MINOR	TX POWER	INTERVAL	ACTIONS	EDIT
    S2Ne f7826da6-4fa2-4e98-8024-bc5b71e0893e	6914	5919	2	350.0	0
    6859 f7826da6-4fa2-4e98-8024-bc5b71e0893e	33690	9767	0	350.0	0
    b6vo f7826da6-4fa2-4e98-8024-bc5b71e0893e	43332	62552	1	350.0	0
    28V4 f7826da6-4fa2-4e98-8024-bc5b71e0893e	45074	36073	3	350.0	0
    L7oH f7826da6-4fa2-4e98-8024-bc5b71e0893e	32877	40218	3	350.0	0
    tFGh f7826da6-4fa2-4e98-8024-bc5b71e0893e	3781	34250	3	350.0	0
    



    Create instances of the UIViewController using a following method:self.storyboard!.instantiateViewControllerWithIdentifier(identifier) method
 
    and Storyboard IDS:
    immediateController
    nearController
    farDistance

    Install the app on the device

    Respond to the beacon related events in the following methods:
    
    beaconsFound(udid:String?, major:Int32, minor:Int32,  proximity:CLProximity, accuracy: CLLocationAccuracy, rssi:Int) - called when iOS estimates distance to nearby beacon
    and:
    regionEvent(udid:String?, major:Int32, minor:Int32,  state:UInt){

    called when region related event is called. 

    
*/


import UIKit

class ViewController: UIViewController {
    var jmcBeaconManager = JMCBeaconManager()
    var immediateController:UIViewController?
    var nearController:UIViewController?
    var farController:UIViewController?
    
    var currentChildController:UIViewController?
    
    @IBOutlet weak var containerView: UIView!


    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //Disable Logging
        jmcBeaconManager.logging = false;
        
        //TODO: Create View Controllers
        

        var message:NSMutableString = ""
        
        if jmcBeaconManager.isSupported(message)
        {
            
            //TODO: Register beacon that you would like to monitor *Using the  jmcBeaconManager.registerRegionWithProximityId method

            
            //TODO: start monitoring for beacons nearby
            jmcBeaconManager.startMonitoring()
            
            jmcBeaconManager.beaconFound = self.beaconsFound
            jmcBeaconManager.regionEvent = self.regionEvent

          
         }
    }
    
    
    
    /*
        Called when the new beacon is found
    */
    func beaconsFound(udid:String?, major:Int32, minor:Int32,  proximity:CLProximity, accuracy: CLLocationAccuracy, rssi:Int){
        //design your interaction/s based on the particular iBeacon and distance to it
        /* Proximity has several different values declared in CLProximity enum:
        enum CLProximity : Int {
            case Unknown 0
            case Immediate 1
            case Near 2
            case Far 3
        }
        */
    }
    
    func regionEvent(udid:String?, major:Int32, minor:Int32,  state:CLRegionState){
        /*
        Check if you are inside or outside region (look into implementation details)
        */
    }
    
    
    
    
    func displayController(controller:UIViewController){
        //check if the current child controller is not the same as the one we want to add
        if self.currentChildController == controller {return}
        self.addChildViewController(controller)
        //remove current controller
        self.removeController()
        //asign a new one
        self.currentChildController = controller

        controller.view.frame = containerView.frame
        self.containerView.addSubview(controller.view)
        controller.didMoveToParentViewController(self)
        
        
    }
    
    func removeController(){
        
        if let controller = self.currentChildController {
            controller.willMoveToParentViewController(nil)
            controller.view.removeFromSuperview()
            controller.removeFromParentViewController()
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*TESTING*/
    @IBAction func functestAddController(sender: AnyObject) {
        let vc = self.storyboard!.instantiateViewControllerWithIdentifier("immediateController") as UIViewController
        displayController(vc)
    }

    @IBAction func testRemovingVC(sender: AnyObject) {
        removeController()
    }
    

}

