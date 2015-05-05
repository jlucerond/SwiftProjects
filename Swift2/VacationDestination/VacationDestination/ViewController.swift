//
//  ViewController.swift
//  VacationDestination
//
//  Created by Joe Lucero on 4/6/15.
//  Copyright (c) 2015 Joe Lucero. All rights reserved.
//

import UIKit
import MapKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var tableView: UITableView!
    var destinations : [Destination] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // i hate this guy
        
 //       createTestDestinations()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(animated: Bool) {
        var context = (UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext!
        var request = NSFetchRequest(entityName: "Destination")
        self.destinations = context.executeFetchRequest(request, error: nil)! as [Destination]
        self.tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return destinations.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var thisDestination = self.destinations[indexPath.row]
        var cell = self.tableView.dequeueReusableCellWithIdentifier("mapCell") as MapCell
        cell.nameLabel.text = thisDestination.name
        
        var coordinate = CLLocationCoordinate2DMake(thisDestination.latti.doubleValue, thisDestination.longi.doubleValue)
        var span = MKCoordinateSpanMake(thisDestination.lattiDelta.doubleValue, thisDestination.longiDelta.doubleValue)
        var region = MKCoordinateRegionMake(coordinate, span)
        cell.mapView.setRegion(region, animated: false)
        
        return cell
    }
    
    func createTestDestinations(){
        var context = (UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext!
        
        var destination1 = NSEntityDescription.insertNewObjectForEntityForName("Destination", inManagedObjectContext: context) as Destination
        destination1.name = "Tokyo"
        destination1.latti = 35.689
        destination1.longi = 139.691
        destination1.lattiDelta = 0.1
        destination1.longiDelta = 0.1
        
        context.save(nil)
        
    }



}

