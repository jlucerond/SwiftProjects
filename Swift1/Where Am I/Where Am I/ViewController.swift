//
//  ViewController.swift
//  Where Am I
//
//  Created by Joe Lucero on 1/20/15.
//  Copyright (c) 2015 Joe Lucero. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    //note that the video used variable name "myMap" instead of "mapView"
    @IBOutlet var mapView: MKMapView!
    
    // label variables
    @IBOutlet var latitudeLabel: UILabel!
    @IBOutlet var longitudeLabel: UILabel!
    @IBOutlet var directionLabel: UILabel!
    @IBOutlet var speedLabel: UILabel!
    @IBOutlet var altitudeLabel: UILabel!
    @IBOutlet var addressLabel: UILabel!
    
    // location manager
    var manager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest

        
        if activePlace == -1
        {
            manager.requestWhenInUseAuthorization()
            manager.startUpdatingLocation()
        }
        
        else
        {
            let lat = NSString(string: places[activePlace]["lat"]!).doubleValue
            let lon = NSString(string: places[activePlace]["lon"]!).doubleValue
            var latitude:CLLocationDegrees = lat
            var longitude:CLLocationDegrees = lon
            var latDelta:CLLocationDegrees = 0.01
            var lonDelta:CLLocationDegrees = 0.01
            var span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
            var location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
            var region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
            mapView.setRegion(region, animated: true)
                
            var annotation = MKPointAnnotation()
            annotation.coordinate = location
            annotation.title = places[activePlace]["name"]
            mapView.addAnnotation(annotation)
        }
        
        var uilpgr = UILongPressGestureRecognizer(target: self, action: "action:")
        uilpgr.minimumPressDuration = 2
        mapView.addGestureRecognizer(uilpgr)
        
    }
    
        func locationManager(manager:CLLocationManager, didUpdateLocations locations:[AnyObject]) {
            
            var userLocation:CLLocation = locations[0] as! CLLocation
            
            var latitude:CLLocationDegrees = userLocation.coordinate.latitude
            
            var longitude:CLLocationDegrees = userLocation.coordinate.longitude
            
            var latDelta:CLLocationDegrees = 0.01
            
            var lonDelta:CLLocationDegrees = 0.01
            
            var span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
            
            var location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
            
            var region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
            
            mapView.setRegion(region, animated: true)
            
            manager.stopUpdatingLocation()
            
            CLGeocoder().reverseGeocodeLocation(userLocation, completionHandler:{(placemarks, error) in
                
                if ((error) != nil)  { println("Error: \(error)") }
                else {
                    
                    let p = CLPlacemark(placemark: placemarks?[0] as! CLPlacemark)
                    
                    var subThoroughfare:String
                    
                    if ((p.subThoroughfare) != nil) {
                        subThoroughfare = p.subThoroughfare
                    } else {
                        subThoroughfare = ""
                    }
                    
 //                   self.address.text =  "\(subThoroughfare) \(p.thoroughfare) \n \(p.subLocality) \n \(p.subAdministrativeArea) \n \(p.postalCode) \(p.country)"
                    
                    
                    
                    
                }
                
                
            })
            
        }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func findMe(sender: AnyObject)
    {
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
        
    }
    
    override func viewWillDisappear(animated: Bool)
    {
        self.navigationController?.navigationBarHidden = false
    }
    
    func action(gestureRecognizer:UIGestureRecognizer) {
        
        
        
        if gestureRecognizer.state == UIGestureRecognizerState.Began {
            
            var touchPoint = gestureRecognizer.locationInView(self.mapView)
            var newCoordinate = mapView.convertPoint(touchPoint, toCoordinateFromView: self.mapView)
        
            var loc = CLLocation(latitude: newCoordinate.latitude, longitude: newCoordinate.longitude)
            
            CLGeocoder().reverseGeocodeLocation(loc, completionHandler:{(placemarks, error) in
                
                if ((error) != nil)  { println("Error: \(error)") }
                else {
                    
                    
                    
                    let p = CLPlacemark(placemark: placemarks?[0] as! CLPlacemark)
                    
                    var subThoroughfare:String
                    var thoroughfare:String
                    
                    if ((p.subThoroughfare) != nil) {
                        subThoroughfare = p.subThoroughfare
                    } else {
                        subThoroughfare = ""
                    }
                    
                    if ((p.thoroughfare) != nil) {
                        thoroughfare = p.thoroughfare
                    } else {
                        thoroughfare = ""
                    }
                    
                    
                    var annotation = MKPointAnnotation()
                    
                    annotation.coordinate = newCoordinate
                    
                    var title = "\(subThoroughfare) \(thoroughfare)"
                    
                    if title == " " {
                        
                        var date = NSDate()
                        
                        title = "Added \(date)"
                        
                    }
                    
                    annotation.title = title
                    
                    self.mapView.addAnnotation(annotation)
                    
                    places.append(["name":title,"lat":"\(newCoordinate.latitude)","lon":"\(newCoordinate.longitude)"])
                    
                    
                }
                
                
            })
            
            
        }
        
        
    }

}

