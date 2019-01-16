//
//  UIColor+Extensions.swift
//  mapsGeoProject
//
//  Created by Michael Bielodied on 1/13/19.
//  Copyright © 2019 Michael Bielodied. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
    
    // Naviagtion
    @objc static let navigationBarItemsTintColor = UIColor.white
    @objc static let navigationBackgroundColor = UIColor(red:0.6, green:0.72, blue:0.72, alpha:1.0)
    // Primary Colors
    @objc static let PrimaryMain: UIColor = UIColor(red: 0.388, green: 0.616, blue: 0.635, alpha: 1.0)
    // Secondary Colors
    @objc static let Secondary1: UIColor = UIColor.init(netHex: 0xA4C2E6)

}
