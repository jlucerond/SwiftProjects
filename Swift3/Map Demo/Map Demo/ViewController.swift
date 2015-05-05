//
//  ViewController.swift
//  Map Demo
//
//  Created by Joe Lucero on 4/17/15.
//  Copyright (c) 2015 iOSDevelopr. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

//CLLocationManagerDelegate- I needed this once I added locationmgr.delegate = self, below

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet var ourMap: MKMapView!
    var locationmgr = CLLocationManager()
    var myRegion : MKCoordinateRegion!
    var turnOff = false

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        var myLat : CLLocationDegrees = 48.8582
//        var myLon : CLLocationDegrees = 2.2945
//        var myLatDel : CLLocationDegrees = 0.001
//        var myLonDel : CLLocationDegrees = 0.001
//        
//        var myCordinate : CLLocationCoordinate2D = CLLocationCoordinate2DMake(myLat, myLon)
//        var mySpan : MKCoordinateSpan = MKCoordinateSpanMake(myLatDel, myLonDel)
//        var myRegion : MKCoordinateRegion = MKCoordinateRegionMake(myCordinate, mySpan)
//        ourMap.setRegion(myRegion, animated: true)
//        
//        var annotation : MKPointAnnotation = MKPointAnnotation()
//        annotation.coordinate = myCordinate
//        annotation.title = "Eiffel Tower"
//        annotation.subtitle = "sacré bleu!"
//        ourMap.addAnnotation(annotation)
        
        var uilpgr = UILongPressGestureRecognizer(target: self, action: "longPressHasBeenTouched:")
        uilpgr.minimumPressDuration = 1.5
        ourMap.addGestureRecognizer(uilpgr)
        
        locationmgr.delegate = self
        locationmgr.desiredAccuracy = kCLLocationAccuracyBest
        locationmgr.requestWhenInUseAuthorization()
        locationmgr.startUpdatingLocation()
        ourMap.showsUserLocation = true
    
    }

    func longPressHasBeenTouched (gestureRecognizer : UIGestureRecognizer) {
        var touchPoint = gestureRecognizer.locationInView(self.ourMap)
        var newCoordinate: CLLocationCoordinate2D = ourMap.convertPoint(touchPoint, toCoordinateFromView: self.ourMap)
        
        var annotation = MKPointAnnotation()
        annotation.coordinate = newCoordinate
        annotation.title = "User Coordinate"
        annotation.subtitle = "You clicked here"
        ourMap.addAnnotation(annotation)
        
    }

    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        var userLocation : CLLocation = locations[0] as! CLLocation
        var latitude = userLocation.coordinate.latitude
        var longitude = userLocation.coordinate.longitude
        var latitudeDelta : CLLocationDegrees = 0.01
        var longitudeDelta : CLLocationDegrees = 0.01
        
        var myCordinate : CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        var mySpan : MKCoordinateSpan = MKCoordinateSpanMake(latitudeDelta, longitudeDelta)
        myRegion = MKCoordinateRegionMake(myCordinate, mySpan)
        
        if turnOff == false {
            ourMap.setRegion(myRegion, animated: false)
            turnOff = true
        }
        
        
    }

}

