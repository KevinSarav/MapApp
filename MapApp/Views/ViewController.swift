//
//  ViewController.swift
//  MapApp
//
//  Created by Saravia, Kevin on 7/29/20.
//  Copyright © 2020 Saravia, Kevin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var mapDB: MapDB!
    
    @IBOutlet weak var scMapType: UISegmentedControl!
    @IBOutlet weak var tfCityName: UITextField!
    @IBOutlet weak var tfLatitude: UITextField!
    @IBOutlet weak var tfLongitude: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        mapDB = MapDB()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func updateMapInfo(_ sender: Any) {
        let city = Map(tfCityName.text ?? "", tfLatitude.text ?? "0.0", tfLongitude.text ?? "0.0")
        mapDB.updateDB(city)
        tfCityName.text = ""
        tfLongitude.text = ""
        tfLatitude.text = ""
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let mapVC = segue.destination as? MapViewController {
            mapDB.type = scMapType.titleForSegment(at: scMapType.selectedSegmentIndex)!
            mapVC.mapDB = mapDB
        }
    }
}

