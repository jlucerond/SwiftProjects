//
//  PatternDetailViewController.swift
//  Patterns
//
//  Created by Joe Lucero on 3/18/15.
//  Copyright (c) 2015 Joe Lucero. All rights reserved.
//

import UIKit

class PatternDetailViewController: UIViewController {
    
    var pattern : Pattern? = nil
    var tappedImage : UIImage? = nil
    @IBOutlet var frontImageView: UIImageView!
    @IBOutlet var backImageView: UIImageView!


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationItem.title = pattern!.name
        frontImageView.image = UIImage(data: pattern!.frontImage)
        backImageView.image = UIImage(data: pattern!.backImage)
        
        var frontTapRecognizer = UITapGestureRecognizer(target: self, action: "frontTapped")
        self.frontImageView.addGestureRecognizer(frontTapRecognizer)
        
        var backTapRecognizer = UITapGestureRecognizer(target: self, action: "backTapped")
        self.backImageView.addGestureRecognizer(backTapRecognizer)
        
    }
    
    func frontTapped(){
        println("it worked!")
        tappedImage = frontImageView.image
        performSegueWithIdentifier("zoomSegue", sender: self)
    }
    
    func backTapped(){
        println("it also worked!")
        tappedImage = backImageView.image
        performSegueWithIdentifier("zoomSegue", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var zoomViewController = segue.destinationViewController as ZoomViewController
        zoomViewController.zoomedInImage = self.tappedImage!
    }
    
}