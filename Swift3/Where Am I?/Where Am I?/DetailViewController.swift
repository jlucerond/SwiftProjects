//
//  DetailViewController.swift
//  Where Am I?
//
//  Created by Joe Lucero on 4/17/15.
//  Copyright (c) 2015 iOSDevelopr. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var latLabel: UILabel!
    @IBOutlet var lonLabel: UILabel!
    @IBOutlet var speedLabel: UILabel!
    @IBOutlet var directionLabel: UILabel!
    @IBOutlet var altitudeLabel: UILabel!
    @IBOutlet var addressLabel: UILabel!
    
    var latLabelText = ""
    var lonLabelText = ""
    var speedLabelText = ""
    var directionLabelText = ""
    var altitudeLabelText = ""
    var addressLabelText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        latLabel.text = latLabelText
        lonLabel.text = lonLabelText
        speedLabel.text = speedLabelText + " mph"
        directionLabel.text = directionLabelText
        altitudeLabel.text = altitudeLabelText
        addressLabel.text = addressLabelText
    }


}
