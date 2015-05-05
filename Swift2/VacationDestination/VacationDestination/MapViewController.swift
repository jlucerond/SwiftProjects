//
//  MapViewController.swift
//  VacationDestination
//
//  Created by Joe Lucero on 4/7/15.
//  Copyright (c) 2015 Joe Lucero. All rights reserved.
//

import UIKit
import MapKit
import CoreData

class MapViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet var imAMapImAMap: MKMapView!
    
    var locationManager : CLLocationManager?
    var firstTime = true
    var destinationName = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.locationManager = CLLocationManager()
        self.locationManager?.requestWhenInUseAuthorization()
        
        // This puts a blue dot on top of the user's location
        //self.imAMapImAMap.showsUserLocation = true
        
        self.locationManager?.delegate = self
        self.locationManager?.startUpdatingLocation()
        
 
        
    }

    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {

        if firstTime{
            let region = MKCoordinateRegionMakeWithDistance(self.locationManager!.location.coordinate, 20000, 20000)
            
            // animated here zooms in on the city location
            self.imAMapImAMap.setRegion(region, animated: false)
            firstTime = false
        }
        
    }
    
    @IBAction func saveButtonTapped(sender: AnyObject) {
        
        var context = (UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext!
        
        var destination1 = NSEntityDescription.insertNewObjectForEntityForName("Destination", inManagedObjectContext: context) as Destination
        destination1.name = destinationName
        destination1.latti = self.imAMapImAMap.region.center.latitude
        destination1.longi = self.imAMapImAMap.region.center.longitude
        destination1.lattiDelta = self.imAMapImAMap.region.span.latitudeDelta
        destination1.longiDelta = self.imAMapImAMap.region.span.longitudeDelta
        
        context.save(nil)
        
        self.dismissViewControllerAnimated(true, completion: nil)

    }


}
