//
//  ViewController.swift
//  NSUserDefaultsExercise
//
//  Created by Janusz Chudzynski on 3/16/15.
//  Copyright (c) 2015 Janusz Chudzynski. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    //TODO: Create an instance of user defaults
  

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.restoreData()
    }
    
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.saveData()
        
    }
    

    
    @IBAction func saveDataAction(sender: AnyObject) {
        saveData()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func saveData(){
       //TODO: Save a value of the nameField.text to user defaults (use setObject forKey method)

    }
    
    func restoreData(){
       //TODO: Restore a value from user defaults (use StringForKey method) make sure that you are using correct if let binding pattern
    
    }
    
    
}

