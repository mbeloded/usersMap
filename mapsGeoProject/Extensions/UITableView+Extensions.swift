//
//  UITableView+Extensions.swift
//  mapsGeoProject
//
//  Created by Michael Bielodied on 1/13/19.
//  Copyright © 2019 Michael Bielodied. All rights reserved.
//

import UIKit

extension UITableView {
    func registerCells(identifiers cells: [String]) {
        //Register cell created in Nib or class
        _ = cells.map { (cellIdentifier) in
            
            if Bundle.main.path(forResource: cellIdentifier, ofType: "nib") != nil {
                let nib = UINib(nibName: cellIdentifier, bundle: nil)
                self.register(nib, forCellReuseIdentifier: cellIdentifier)
                
            } else {
                self.register(cellIdentifier.stringClassFromString().self, forCellReuseIdentifier: cellIdentifier)
            }
        }
    }
}
