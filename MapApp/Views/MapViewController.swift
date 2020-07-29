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

            let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 750, longitudinalMeters: 750)
            mvMap.region = region
        }
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
