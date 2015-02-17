//
//  VenuesListViewController.swift
//  UWF
//
//  Created by Janusz Chudzynski on 2/16/15.
//  Copyright (c) 2015 Janusz Chudzynski. All rights reserved.
//

import Foundation
import UIKit

class VenueModel{
    var name:String
    var imageNameFile:String
    var description:String
    
    init(){
        name = "Default"
        imageNameFile = "Default"
        description = "Default"
    }
    
    convenience init(name:String,image:String, description:String){
        self.init()
        self.imageNameFile = image
        self.description = description
        self.name = name
        
    }
}


class VenuesListViewController : UITableViewController{

    var venues = [VenueModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        venues.append(VenueModel(name: "Nautilus Market", image: "nautilus.jpg", description: "The Nautilus Market features an abundant variety of nutritionally balanced hot and cold entrees, grill favorites, ethnic cuisine, sandwiches, sides, desserts, ice cream and beverages in an all-you-care-to-eat format. The Nautilus Market is the campus all-you-care-to-eat and meal plan dining facility. Entry to the facility is via one meal plan swipe or payment of the Door Price - $7.50 for Breakfast, $8.75 for Lunch, $9.50 for Dinner beginning Fall 2014."))
        
        venues.append(VenueModel(name: "Argo Galley", image: "galley.jpg", description: "Argo Galley is a casual restaurant offering breakfast, lunch and dinner. The Galley serves Caribou Coffee. The Galley is “the” gathering place with great food and fun events"))
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.venues.count
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int{
        return 1
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //UITableViewCell
        var cell =  tableView.dequeueReusableCellWithIdentifier("venueCell") as UITableViewCell
        cell.textLabel!.text = self.venues[indexPath.row].name
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetails" {
            var venueViewController =  segue.destinationViewController as DiningVenueViewController
            var index = self.tableView.indexPathForSelectedRow()!
            var venue = self.venues[index.row]
            venueViewController.venueInformation = venue
        }
    }
    
    
    override func shouldPerformSegueWithIdentifier(identifier: String?, sender: AnyObject?) -> Bool {
        if identifier == "showDetails" {
            
            
        }
        return true
    }
    
    
 
}