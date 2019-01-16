//
//  Common.swift
//  mapsGeoProject
//
//  Created by Michael Bielodied on 1/13/19.
//  Copyright © 2019 Michael Bielodied. All rights reserved.
//

import Foundation

class Common: NSObject {
    struct Global{
        static let API_URL = "https://restcountries.eu/rest/v2"
        static let API_ALL = "/all"
        static let API_LOCATIONS_BY_NAME = "/locations/%@"
    }
    
    static var getAll: String {
        return Common.Global.API_URL + Common.Global.API_ALL
    }
    
    static var getLocationsByUserId: String {
        return Common.Global.API_URL + Common.Global.API_LOCATIONS_BY_NAME
    }

}
