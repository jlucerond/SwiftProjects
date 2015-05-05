//
//  ZoomViewController.swift
//  Patterns
//
//  Created by Joe Lucero on 3/19/15.
//  Copyright (c) 2015 Joe Lucero. All rights reserved.
//

import UIKit


class ZoomViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var imageView: UIImageView!
    
    var zoomedInImage: UIImage? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        // Code Like a Champion Today
        
        self.scrollView.minimumZoomScale = 1
        self.scrollView.maximumZoomScale = 10
        self.scrollView.delegate = self
        self.imageView.image = zoomedInImage?
    }
    

    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}
