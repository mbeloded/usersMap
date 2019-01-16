//
//  Location.swift
//  mapsGeoProject
//
//  Created by Michael Bielodied on 1/13/19.
//  Copyright © 2019 Michael Bielodied. All rights reserved.
//

import Foundation

struct Location : Decodable {
    let locationID: String
    let lat: Double
    let lng: Double
    let accuracy: Double
    let timestamp: String
    let address: String
}
