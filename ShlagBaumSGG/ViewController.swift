//
//  ViewController.swift
//  ShlagBaumSGG
//
//  Created by Александр Пономаренко on 15.09.14.
//  Copyright (c) 2014 Александр Пономаренко. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation



class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet var map: MKMapView!
    var locationManager: CLLocationManager = CLLocationManager()

    override func viewDidLoad() {
      
        super.viewDidLoad()
        let ButtonBorderCollor = UIColor(red: 0.46, green: 0.66, blue: 0.81, alpha: 1).CGColor
        Button[0].layer.borderColor = ButtonBorderCollor
        Button[1].layer.borderColor = ButtonBorderCollor
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self;
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        let noLocation = CLLocationCoordinate2D(latitude: 66.0852, longitude: 76.69955)
        let viewRegion = MKCoordinateRegionMakeWithDistance(noLocation, 0, 0)
        var poinOfShlag = MKPointAnnotation();
        poinOfShlag.coordinate = noLocation;
        poinOfShlag.title = "Шлагбаум СГГ"
        poinOfShlag.subtitle = "Отметка сработает за 20 метров"
        self.map.addAnnotation(poinOfShlag)
        
        self.map.region = viewRegion
        self.map.showsUserLocation = true
        self.map.region.span = MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002)
        
       
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
   
    @IBOutlet var Button: [UIButton]!
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        println("\(locationManager.location.coordinate.latitude)")
        self.map.showsUserLocation = true
    }
    
    let redImg = UIImage(named:"Button_New_Red.png")

    @IBAction func InDown(sender: UIButton) {
        sender.backgroundColor = UIColor(red: 0.46, green: 0.66, blue: 0.81, alpha: 1)
    }
    @IBAction func InCancel(sender: UIButton) {
        sender.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        
    }

}







