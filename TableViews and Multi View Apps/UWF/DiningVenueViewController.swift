//
//  DiningVenueViewController.swift
//  UWF
//
//  Created by Janusz Chudzynski on 2/16/15.
//  Copyright (c) 2015 Janusz Chudzynski. All rights reserved.
//

import Foundation
import UIKit

class DiningVenueViewController:UIViewController{
    
    @IBOutlet weak var venueName: UILabel!
    @IBOutlet weak var venueImage: UIImageView!
    @IBOutlet weak var venueDescription: UITextView!
    
    var venueInformation:VenueModel = VenueModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if countElements(venueInformation.name) > 0 {
            self.venueName.text = venueInformation.name
        }
        if countElements(venueInformation.description) > 0 {
            self.venueDescription.text = self.venueInformation.description
        }
        if let image = UIImage(named: venueInformation.imageNameFile) {
            self.venueImage.image = image
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}