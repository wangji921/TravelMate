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
        
        
        
//        let url = URL(string: "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=-36.8808,174.7078&radius=5000&type=bank&keyword=anz&key=AIzaSyAFtyOmHHbOw5-jqGYR0racTRMb8mcPa9o")
//            let task = URLSession.shared.dataTask(with: url as URLRequest) { (data, response, error) in
//
//                if error != nil {
//                    print(error!)
//                } else {
//
//                    if let urlContent = data {
//                        do {
//                            let jsonResult = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
//
//                            print(jsonResult)
//                            print(jsonResult["name"]!!)
//                        } catch {
//                            print("JSON processing failed")
//                        }
//                    }
//                }
//            }
//            task.resume()
        
        let url = URL(string: "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=-36.8808,174.7078&radius=50000&type=bank&keyword=anz&key=AIzaSyAFtyOmHHbOw5-jqGYR0racTRMb8mcPa9o")
        if let usableUrl = url {
            let request = URLRequest(url: usableUrl)
            let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
                if error != nil {
                    print(error!)
                } else {
                    
                    if let data = data {
                        do {
                            let jsonResult = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                            
                            if let results = jsonResult["results"] as? [[String: AnyObject]] {
                                for result in results {
                                    print(result)
                                    let name = result["name"] as? String
                                    let placeId = result["place_id"] as? String
                                    let geometry = result["geometry"] as? [String: AnyObject]
                                    let location = geometry?["location"] as? [String: Double]
                                    let lat = location?["lat"]
                                    let lng = location?["lng"]
                                    
                                }
                            }
                        } catch {
                            print("JSON processing failed")
                        }
                    }
                }
            })
            task.resume()
        }
        
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
    
    lazy var menu: moreMenu = {
        let launcher = moreMenu()
        launcher.homeController = self
        return launcher
    }()
    
    @objc func handleMore() {
//        menu.homeController = self
        menu.showMore()
        
//       showControllerForSettings()
    }
    
    func showControllerForSetting(setting: Setting) {
        let dummySettingsViewController = UIViewController()
        dummySettingsViewController.view.backgroundColor = UIColor.white
        dummySettingsViewController.navigationItem.title = setting.name
//        navigationController?.navigationBar.tintColor = UIColor.white
//        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.blue]
        navigationController?.pushViewController(dummySettingsViewController, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

}

