//
//  PersonAnnotation.swift
//  mapsGeoProject
//
//  Created by Michael Bielodied on 1/13/19.
//  Copyright © 2019 Michael Bielodied. All rights reserved.
//

import UIKit
import MapKit
import Contacts

class PersonAnnotation: NSObject, MKAnnotation {
    
    fileprivate let defaultUserPimages = [#imageLiteral(resourceName: "ic_marceline"),#imageLiteral(resourceName: "ic_jake.png"),#imageLiteral(resourceName: "ic_lumpy-space-princess.png"),#imageLiteral(resourceName: "ic_marceline.png"),#imageLiteral(resourceName: "ic_mongrol.png"),#imageLiteral(resourceName: "genie"),#imageLiteral(resourceName: "rick-sanchez"),#imageLiteral(resourceName: "ninja-turtle"),#imageLiteral(resourceName: "bill-cipher"),#imageLiteral(resourceName: "steven-universe"),#imageLiteral(resourceName: "mermaid"),#imageLiteral(resourceName: "ic_finn")]//MARK: to show random placeholders for annotationView
    
    let title: String?
    let photoUrl: String
    let coordinate: CLLocationCoordinate2D
    let personId: String
    let address: String
    let defPlaceholderImage: UIImage?
    
    init(_ person: Person) {
        self.personId = person.userID
        self.title = person.name
        self.photoUrl = person.photoUrl
        self.coordinate = CLLocationCoordinate2D.init(latitude: person.location.lat, longitude: person.location.lng)
        self.address = person.location.address
        self.defPlaceholderImage = defaultUserPimages.randomElement()
    }
    
    init(id: String, title: String, photoUrl: String, coordinate: CLLocationCoordinate2D, address: String) {
        self.personId = id
        self.title = title
        self.photoUrl = photoUrl
        self.coordinate = coordinate
        self.address = address
        self.defPlaceholderImage = defaultUserPimages.randomElement()
    }
    
    var subtitle: String? {
        return String(format: "%@ (%d:%d)", address, coordinate.latitude, coordinate.longitude)
    }
    
    // Annotation right callout accessory opens this mapItem in Maps app
    func mapItem() -> MKMapItem {
        let addressDict = [CNPostalAddressStreetKey: subtitle!]
        let placemark = MKPlacemark(coordinate: coordinate, addressDictionary: addressDict)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = self.title
        return mapItem
    }
}

func == (lhs: PersonAnnotation, rhs: PersonAnnotation) -> Bool {
    return lhs.personId == rhs.personId
}
