//
//  Map.swift
//  MapApp
//
//  Created by Saravia, Kevin on 7/29/20.
//  Copyright © 2020 Saravia, Kevin. All rights reserved.
//

import Foundation

class Map
{
    var cityName: String
    var latitude: Double
    var longitude: Double
    
    init(_ cityName: String, _ latitude: String, _ longitude: String) {
        self.cityName = cityName
        self.latitude = Double(latitude) ?? 0.0
        self.longitude = Double(longitude) ?? 0.0
    }
}
