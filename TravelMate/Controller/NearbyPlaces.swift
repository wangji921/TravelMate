//
//  NearbyPlaces.swift
//  TravelMate
//
//  Created by Ji Wang on 11/11/17.
//  Copyright © 2017 DingandJi. All rights reserved.
//

import UIKit
import GooglePlaces
import GoogleMaps

class NearbyPlaces: UIViewController {
//    func fetchPlacesNearCoordinate(coordinate: CLLocationCoordinate2D, radius: Double, name : String){
//        var urlString = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?key=\(GMSServices.apikey)&location=\(coordinate.latitude),\(coordinate.longitude)&radius=\(radius)"
//        urlString += "&name=\(name)"
//
//        urlString = urlString.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!
//        print(urlString)
//        if placesTask.taskIdentifier > 0 && placesTask.state == .Running {
//            placesTask.cancel()
//
//        }
//        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
//        placesTask = session.dataTaskWithURL(NSURL(string: urlString)!) {data, response, error in
//            println("inside.")
//            UIApplication.sharedApplication().networkActivityIndicatorVisible = false
//            if let json = NSJSONSerialization.JSONObjectWithData(data, options:nil, error:nil) as? NSDictionary {
//                if let results = json["results"] as? NSArray {
//                    for rawPlace:AnyObject in results {
//                        println(rawPlace)
//                        self.results.append(rawPlace as! String)
//                    }
//                }
//            }
//            self.placesTask.resume()
//        }
//    }
//    
//    func url() {
//        let url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=-36.8808,174.7078&radius=5000&type=bank&keyword=anz&key=AIzaSyAFtyOmHHbOw5-jqGYR0racTRMb8mcPa9o"
//        let task = URLSession.shared.dataTask(with: url as URLRequest) { (data, response, error) in
//            
//            if error != nil {
//                print(error!)
//            } else {
//                
//                if let urlContent = data {
//                    do {
//                        let jsonResult = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
//                        
//                        print(jsonResult)
//                        print(jsonResult["name"]!!)
//                    } catch {
//                        print("JSON processing failed")
//                    }
//                }
//            }
//        }
//        task.resume()
//    }
}
