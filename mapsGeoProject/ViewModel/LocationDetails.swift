//
//  LocationDetails.swift
//  mapsGeoProject
//
//  Created by Michael Bielodied on 1/13/19.
//  Copyright © 2019 Michael Bielodied. All rights reserved.
//

import Foundation

struct LocationDetails {
    var title: String
    var timeStamp: String
    var description: String
    
    init(_ location: Location) {
        self.title = location.address
        self.description = String(format: "(%d : %d), \("accuracy.title".localized): %d", location.lat, location.lng, location.accuracy)
        self.timeStamp = DateFormatter.date(from: location.timestamp) ?? ""
    }
    
    init(_ title: String = "", description: String = "", timestamp: String = "") {
        self.title = title
        self.description = description
        self.timeStamp = timestamp
    }
}
