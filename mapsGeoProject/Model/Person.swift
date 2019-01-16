//
//  Person.swift
//  mapsGeoProject
//
//  Created by Michael Bielodied on 1/13/19.
//  Copyright © 2019 Michael Bielodied. All rights reserved.
//

import Foundation

struct Person : Decodable {
    //userID, name, photoUrl, location
    let userID: String
    let name: String
    let photoUrl: String
    let location: Location
}
