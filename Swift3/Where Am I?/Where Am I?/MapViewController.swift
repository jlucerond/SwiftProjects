//
//  MapViewController.swift
//  Where Am I?
//
//  Created by Joe Lucero on 4/17/15.
//  Copyright (c) 2015 iOSDevelopr. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    //IB Outlets
    @IBOutlet var myMap: MKMapView!
    
    //variables
    var locationmgr = CLLocationManager()
    var myRegion : MKCoordinateRegion!
    var turnOff = false
    var userLat : CLLocationDegrees?
    var userLon : CLLocationDegrees?
    var speed : CLLocationSpeed?
    var direction : CLLocationDirection?
    var altitude : CLLocationDistance?
    var address : String?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        //let's code
        
        locationmgr.delegate = self
        locationmgr.desiredAccuracy = kCLLocationAccuracyBest
        locationmgr.requestWhenInUseAuthorization()
        locationmgr.startUpdatingLocation()
        myMap.showsUserLocation = true
        
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        var userLocation : CLLocation = locations[0] as! CLLocation
        var latitude = userLocation.coordinate.latitude
        userLat = latitude
        var longitude = userLocation.coordinate.longitude
        userLon = longitude
        var latitudeDelta : CLLocationDegrees = 0.05
        var longitudeDelta : CLLocationDegrees = 0.05
        speed = userLocation.speed
        direction = userLocation.course
        altitude = userLocation.altitude
        
        
        var myCordinate : CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        var mySpan : MKCoordinateSpan = MKCoordinateSpanMake(latitudeDelta, longitudeDelta)
        myRegion = MKCoordinateRegionMake(myCordinate, mySpan)
        myMap.setRegion(myRegion, animated: true)
        locationmgr.stopUpdatingLocation()
        
        CLGeocoder().reverseGeocodeLocation(userLocation, completionHandler: { (placemarks, error) -> Void in
            if ((error) != nil)  { println("Error: \(error)") }
            else {
                
                let p = CLPlacemark(placemark: placemarks?[0] as! CLPlacemark)
                // self.address.text =  "\(subThoroughfare) \(p.thoroughfare) \n \(p.subLocality) \n \(p.subAdministrativeArea) \n \(p.postalCode) \(p.country)"

//                var mySTF = p.subThoroughfare
//                var myTF = p.thoroughfare
//                var mySL = p.subLocality
//                var mySAA = p.subAdministrativeArea
//                var myPC = p.postalCode
//                var myC = p.country
                
                if ((p.subThoroughfare) != nil) {
                    self.address = "\(p.subThoroughfare) \(p.thoroughfare) \n \(p.subLocality) \n \(p.subAdministrativeArea) \n \(p.postalCode) \(p.country)"
                }
                else {
                    self.address = ""
                }
                
            }
            
            
        })
        
    }

    @IBAction func refreshButtonPressed(sender: AnyObject) {
        locationmgr.startUpdatingLocation()
        myMap.setRegion(myRegion, animated: true)
        locationmgr.stopUpdatingLocation()
    }
    
    // user's lat, lon, alt, speed & nearest address (reverse geocode location)
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var nextViewController = segue.destinationViewController as! DetailViewController
        
        if userLat != nil && userLon != nil {
            nextViewController.latLabelText = "\(userLat!)"
            nextViewController.lonLabelText = "\(userLon!)"
            nextViewController.speedLabelText = "\(speed!)"
            nextViewController.directionLabelText = "\(direction!)"
            nextViewController.altitudeLabelText = "\(altitude!)"
            nextViewController.addressLabelText = "\(address!)"
        }
    }


}

