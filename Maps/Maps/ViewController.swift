//
//  ViewController.swift
//  Maps
//
//  Created by Gary Hicks on 2018-02-06.
//  Copyright © 2018 Gary Hicks. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        /*let latitude: CLLocationDegrees = 40.7
        let longitude: CLLocationDegrees = -73.9
        let latDelta: CLLocationDegrees = 0.05
        let longDelta: CLLocationDegrees = 0.05
        let span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: longDelta)
        let location:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let region: MKCoordinateRegion = MKCoordinateRegion(center: location, span: span)
        map.setRegion(region, animated: true)*/
        
        let latitude: CLLocationDegrees = 45.281889
        let longitude: CLLocationDegrees = -75.851787
        let latDelta: CLLocationDegrees = 0.01
        let longDelta: CLLocationDegrees = 0.01
        let span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: longDelta)
        let location: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let region: MKCoordinateRegion = MKCoordinateRegion(center: location, span: span)
        map.setRegion(region, animated: true)
        
        //New lesson
        
        let annotation = MKPointAnnotation()
        annotation.title = "Home"
        annotation.subtitle = "I want to go here!"
        annotation.coordinate = location
        map.addAnnotation(annotation)
        
        let uilpgr = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.longPress(gestureRecognizer:)))
        uilpgr.minimumPressDuration = 2
        map.addGestureRecognizer(uilpgr)
    }
    
    @objc func longPress(gestureRecognizer: UIGestureRecognizer){
        
        let touchPoint = gestureRecognizer.location(in: self.map)
        let location  = map.convert(touchPoint, toCoordinateFrom: self.map)
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "New Place"
        annotation.subtitle = "Go here!"
        map.addAnnotation(annotation)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

