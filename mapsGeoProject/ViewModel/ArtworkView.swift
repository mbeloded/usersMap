//
//  ArtworkMarkerView.swift
//  mapsGeoProject
//
//  Created by Michael Bielodied on 1/15/19.
//  Copyright © 2019 Michael Bielodied. All rights reserved.
//

import MapKit

class ArtworkView: MKAnnotationView {
    
    override var annotation: MKAnnotation? {
        willSet {
            guard let artwork = newValue as? PersonAnnotation else {return}
            canShowCallout = true
            calloutOffset = CGPoint(x: -5, y: 5)
            rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            
            self.imageFromServerURL(artwork.photoUrl, placeHolder: artwork.defPlaceholderImage)

        }
    }
}

let imageCache = NSCache<NSString, UIImage>()

extension MKAnnotationView {
    
    func imageFromServerURL(_ URLString: String, placeHolder: UIImage?) {
        
        self.image = nil
        if let cachedImage = imageCache.object(forKey: NSString(string: URLString)) {
            self.image = cachedImage
            return
        }
        
        if let url = URL(string: URLString) {
            URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                
                //print("RESPONSE FROM API: \(response)")
                if error != nil {
                    print("ERROR LOADING IMAGES FROM URL: \(error)")
                    DispatchQueue.main.async {
                        self.image = placeHolder
                    }
                    return
                }
                DispatchQueue.main.async {
                    if let data = data {
                        if let downloadedImage = UIImage(data: data) {
                            imageCache.setObject(downloadedImage, forKey: NSString(string: URLString))
                            self.image = downloadedImage
                        }
                    }
                }
            }).resume()
        }
    }
}
