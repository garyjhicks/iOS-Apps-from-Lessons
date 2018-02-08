//
//  ViewController.swift
//  LocationAware
//
//  Created by Gary Hicks on 2018-02-06.
//  Copyright © 2018 Gary Hicks. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate{

    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    @IBOutlet weak var courseLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var altitudeLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let userLocation: CLLocation = locations[0]
        
        self.latitudeLabel.text = String(userLocation.coordinate.latitude)
        self.longitudeLabel.text = String(userLocation.coordinate.longitude)
        self.courseLabel.text = String(userLocation.course)
        self.speedLabel.text = String(userLocation.speed)
        self.altitudeLabel.text = String(userLocation.altitude)
        
        CLGeocoder().reverseGeocodeLocation(userLocation) { (placemarks, error) in
            if error != nil {
                print(error)
            }
            else {
                
                if let placemark = placemarks?[0] {
                    
                    var address = ""
                    if placemark.subThoroughfare != nil {
                        address += placemark.subThoroughfare! + " "
                    }
                    
                    if placemark.thoroughfare != nil {
                        address += placemark.thoroughfare! + "\n"
                    }
                    
                    if placemark.subLocality != nil {
                        address += placemark.subLocality! + "\n"
                    }
                    
                    if placemark.subAdministrativeArea != nil {
                        address += placemark.subAdministrativeArea! + "\n"
                    }
                    
                    if placemark.postalCode != nil {
                        address += placemark.postalCode! + "\n"
                    }
                    
                    if placemark.country != nil {
                        address += placemark.country! + "\n"
                    }
                    
                    self.addressLabel.text = address
                }
            }
        }
        
    }
    
}

