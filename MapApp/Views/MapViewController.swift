//
//  MapViewController.swift
//  MapApp
//
//  Created by Saravia, Kevin on 7/29/20.
//  Copyright © 2020 Saravia, Kevin. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    var mapDB: MapDB!
    var annotation: MKPointAnnotation!
    
    @IBOutlet weak var mvMap: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillMap()
        setMapType()
    }
    
    func fillMap() {
        for city in mapDB.allCities {
            let coordinate: CLLocationCoordinate2D = CLLocationCoordinate2DMake(city.latitude, city.longitude)
            addAnnotation(coordinate, city.cityName)

            // The below line should have a region big enough to fit all cities, but I did not have time to do that. I would have to calculate the center of all cities and make the region big enough to reach all of them. Or I could use min(max(...)) that we used in class.
            // All this line does is make the region around the last city.
            let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 750, longitudinalMeters: 750)
            mvMap.region = region
        }
        tapGesture()
    }
    
    func tapGesture() {
        // I did not have time to test this feature. Below code is what I think the tap gesture should kind of look like. Code is commented out to prevent possible crash.
        // mvMap.addGestureRecognizer(UITapGestureRecognizer(target: mvMap, action: Selector("tap:")))
    }
    
    @objc func tap(_ gesture: UITapGestureRecognizer) {
        // Not sure exactly what goes here.
        // let location = gesture.location(in: mvMap)
        // let coordinate = mvMap.convert(location, toCoordinateFrom: mvMap)
        // addAnnotation(coordinate, "New City")
    }
    
    func setMapType() {
        switch mapDB.type {
        case "Standard":
            mvMap.mapType = MKMapType.standard
        case "Satellite":
            mvMap.mapType = MKMapType.satellite
        case "Hybrid":
            mvMap.mapType = MKMapType.hybrid
        default: break
        }
    }

    func addAnnotation(_ coordinate: CLLocationCoordinate2D, _ title: String) {
        annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = title
        mvMap.addAnnotation(annotation)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let VC = segue.destination as? ViewController {
            VC.mapDB = mapDB
        }
    }
}
