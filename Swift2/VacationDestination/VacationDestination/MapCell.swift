//
//  MapCell.swift
//  VacationDestination
//
//  Created by Joe Lucero on 4/6/15.
//  Copyright (c) 2015 Joe Lucero. All rights reserved.
//

import UIKit
import MapKit

class MapCell: UITableViewCell {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var mapView: MKMapView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
