//
//  Error.swift
//  mapsGeoProject
//
//  Created by Michael Bielodied on 1/13/19.
//  Copyright © 2019 Michael Bielodied. All rights reserved.
//

import Foundation

enum ErrorResult: Error {
    case network(string: String)
    case parser(string: String)
    case custom(string: String)
}
