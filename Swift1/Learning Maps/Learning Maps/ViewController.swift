//
//  ViewController.swift
//  Learning Maps
//
//  Created by Joe Lucero on 1/16/15.
//  Copyright (c) 2015 Joe Lucero. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    @IBOutlet var mapView: MKMapView!
    
    var manager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Core Location
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
        // 38.898578, -77.036637 = White House location

        var latitude:CLLocationDegrees = 38.898578
        var longitude:CLLocationDegrees = -77.036637
        var latDelta: CLLocationDegrees = 0.01
        var lonDelta: CLLocationDegrees = 0.01
        var span: MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
        var location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        var region: MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        mapView.setRegion(region, animated: true)
        
        var annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "The White House"
        annotation.subtitle = "The President's Crib"
        mapView.addAnnotation(annotation)
        
        var uilpgr = UILongPressGestureRecognizer(target: self, action: "action:")
        
        uilpgr.minimumPressDuration = 2.0
        
        mapView.addGestureRecognizer(uilpgr)
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func action(gestureRecognizer:UIGestureRecognizer)
    {
        var touchPoint = gestureRecognizer.locationInView(self.mapView)
        var newCoordinate: CLLocationCoordinate2D = mapView.convertPoint(touchPoint, toCoordinateFromView: self.mapView)
        
        var newAnnotation = MKPointAnnotation()
        newAnnotation.coordinate = newCoordinate
        newAnnotation.title = "WH"
        newAnnotation.subtitle = "The President's Crib"
        mapView.addAnnotation(newAnnotation)
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [AnyObject]) {
        
        var userLocation: CLLocation = locations[0] as CLLocation
        println(userLocation.coordinate.latitude)
        
        var latitude:CLLocationDegrees = userLocation.coordinate.latitude
        var longitude:CLLocationDegrees = userLocation.coordinate.longitude
        var latDelta: CLLocationDegrees = 0.01
        var lonDelta: CLLocationDegrees = 0.01
        var span: MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
        var location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        var region: MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        mapView.setRegion(region, animated: true)
        
    }
    
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        println(error)
    }


}

