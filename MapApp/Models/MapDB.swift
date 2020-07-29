//
//  MapDB.swift
//  MapApp
//
//  Created by Saravia, Kevin on 7/29/20.
//  Copyright © 2020 Saravia, Kevin. All rights reserved.
//

import Foundation

class MapDB
{
    var allCities: Array<Map>
    var type: String!
    
    init() {
        allCities = []
        type = ""
    }
    
    func updateDB(_ city: Map) {
        allCities.append(city)
    }
}
