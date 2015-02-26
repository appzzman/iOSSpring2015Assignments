//
//  MapViewController.swift
//  UWFMap
//
//  Created by Janusz Chudzynski on 2/23/15.
//  Copyright (c) 2015 Janusz Chudzynski. All rights reserved.
//

import Foundation
import UIKit

class MapViewController: UIViewController {
    @IBOutlet weak var topImage: UIImageView!
    @IBOutlet weak var bottomImage: UIImageView!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var location:Location = Location()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let tmage = UIImage(named: location.image1) {
            self.topImage.image = tmage
        }
        
        if let lmage = UIImage(named: location.image2) {
            self.bottomImage.image = lmage
        }
        
        self.descriptionTextView.text = location.description        
        
    }

}

