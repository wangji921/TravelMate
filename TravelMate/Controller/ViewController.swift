//
//  ViewController.swift
//  TravelMate
//
//  Created by Ji Wang on 6/11/17.
//  Copyright © 2017 DingandJi. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    var locationManager = CLLocationManager()
    var currentLocation: CLLocation?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let camera = GMSCameraPosition.camera(withLatitude: -40.9006, longitude: 174.8860, zoom: 5.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.settings.myLocationButton = true
        mapView.settings.compassButton = true
        mapView.isMyLocationEnabled = true
        view = mapView
        
//        let marker = GMSMarker()
//        marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
//        marker.title = "Sydney"
//        marker.snippet = "Australia"
//        marker.map = mapView
        
        locationManager = CLLocationManager()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.distanceFilter = 100
        locationManager.startUpdatingLocation()
        locationManager.delegate = self
        
        setupNavBarButtons()
    }
    
    func setupNavBarButtons() {
        let moreButton = UIBarButtonItem(image: #imageLiteral(resourceName: "more"), style: .plain, target: self, action: #selector(handleMore))
        
        navigationItem.rightBarButtonItem = moreButton
    }
    
    
//    let blackView = UIView()
//
//    @objc func handleMore() {
//        if let window = UIApplication.shared.keyWindow{
//
//            blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)
//            blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handlemiss)))
//
//            window.addSubview(blackView)
//            blackView.frame = window.frame
//            blackView.alpha = 0
//
//            UIView.animate(withDuration: 0.5, animations: {self.blackView.alpha = 1})
//        }
//
//    }
//
//    @objc func handlemiss() {
//        UIView.animate(withDuration: 0.5, animations:{ self.blackView.alpha = 0})
//    }
    
    let menu = moreMenu()
    
    @objc func handleMore() {
        menu.More()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

