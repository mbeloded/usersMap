//
//  UITableViewCell+Extensions.swift
//  mapsGeoProject
//
//  Created by Michael Bielodied on 1/13/19.
//  Copyright © 2019 Michael Bielodied. All rights reserved.
//

import UIKit

// MARK: - UITableViewCell
extension UITableViewCell {
    class var identifierCell: String {
        return String(describing: self)
    }
    
    class var nibCell: UINib {
        return UINib(nibName: identifierCell, bundle: nil)
    }
}
