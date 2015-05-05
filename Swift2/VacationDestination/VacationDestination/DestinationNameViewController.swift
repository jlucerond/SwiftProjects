//
//  DestinationNameViewController.swift
//  VacationDestination
//
//  Created by Joe Lucero on 4/7/15.
//  Copyright (c) 2015 Joe Lucero. All rights reserved.
//

import UIKit

class DestinationNameViewController: UIViewController {

    @IBOutlet var destinationNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func cancelButtonTapped(sender: AnyObject) {
        self.dismissViewControllerAnimated(true , completion: nil)
    }
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "iHitTheNextButton" {
            let mapController = segue.destinationViewController as MapViewController
            mapController.destinationName = destinationNameTextField.text
        }
    }

}
