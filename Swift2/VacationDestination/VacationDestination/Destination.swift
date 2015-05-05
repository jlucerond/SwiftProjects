//
//  Destination.swift
//  VacationDestination
//
//  Created by Joe Lucero on 4/6/15.
//  Copyright (c) 2015 Joe Lucero. All rights reserved.
//

import Foundation
import CoreData

class Destination: NSManagedObject {

    @NSManaged var latti: NSNumber
    @NSManaged var longi: NSNumber
    @NSManaged var name: String
    @NSManaged var lattiDelta: NSNumber
    @NSManaged var longiDelta: NSNumber

}
