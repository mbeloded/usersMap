//
//  Result.swift
//  mapsGeoProject
//
//  Created by Michael Bielodied on 1/13/19.
//  Copyright © 2019 Michael Bielodied. All rights reserved.
//

import Foundation

enum Result<T, E: Error> {
    case success(T)
    case failure(E)
}
