//
//  FirstViewController.swift
//  RGSA 1.2
//
//  Created by Matthew Ramanah on 26/6/17.
//  Copyright © 2017 Matthew Ramanah. All rights reserved.
//


import UIKit
import MapKit
import CoreLocation

class FirstViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var Map: MKMapView!
    @IBOutlet weak var LatData: UILabel!
    @IBOutlet weak var LongData: UILabel!
    
    let manager = CLLocationManager()
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        let location = locations[0]
        
        let span: MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01)
        let myLocation: CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        let region: MKCoordinateRegion = MKCoordinateRegionMake(myLocation, span)
        Map.setRegion(region, animated:true)
        
        self.Map.showsUserLocation = true
        self.LatData.text = String(format: "%.3f", location.coordinate.latitude)
        self.LongData.text = String(format: "%.3f", location.coordinate.longitude)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

