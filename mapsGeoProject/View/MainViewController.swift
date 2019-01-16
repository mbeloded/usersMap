//
//  ViewController.swift
//  mapsGeoProject
//
//  Created by Michael Bielodied on 1/13/19.
//  Copyright © 2019 Michael Bielodied. All rights reserved.
//

import UIKit
import MapKit

class MainViewController: BaseViewController {

    //MARK: - variables
    fileprivate let detailsSegue = "showDetails"
    
    var persons: [PersonAnnotation] = []
    
    //MARK: - outlets
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var usersInfoView: UsersInfoView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.title = "user.map.title".localized
        
        // Do any additional setup after loading the view, typically from a nib.
        self.mapView.showsUserLocation = true
        self.mapView.isZoomEnabled = true
        self.mapView.isRotateEnabled = true
        self.mapView.register(ArtworkView.self,
                              forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        
        loadData()
        
    }

    override func rightButtonAction() {
        //
        super.rightButtonAction()
        loadData()
    }
    
    override func loadData() {
        //
        PersonService.shared.getAllUsers { [weak self] result in
            
            switch result {
            case .success(let persons) :
                // reload data

                let newPersons = persons.map({return PersonAnnotation(_ : $0)})
                if let currentPersons = self?.persons {
                    
                    let newArrayOfPersons = ArrayHelper.diff(currentPersons, newPersons, with: ==).inserted
                    
                    for person in newArrayOfPersons {
                        self?.persons.append(person)
                        self?.mapView.addAnnotation(person)
                    }
                    
                    self?.usersInfoView?.usersCnt = self?.persons.count ?? 0
                    
                }
                
                break
            case .failure(let error) :
                print("Result error \(error)")//show the error
                break
            }
            
        }
    }
    
    private func openDetails(for person: PersonAnnotation) {
        
        self.performSegue(withIdentifier: detailsSegue, sender: person)

    }
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
        if segue.identifier == detailsSegue {
            let personDetails = (segue.destination as? DetailsViewController)!
            if let person = sender as? PersonAnnotation {
                personDetails.person = person
            }
        }
     }

}

extension MainViewController : MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation { return nil }
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        
        if annotationView == nil {
            annotationView = ArtworkView(annotation: annotation, reuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        } else {
            annotationView!.annotation = annotation
        }
        return annotationView
    }
   
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView,
                 calloutAccessoryControlTapped control: UIControl) {
        print("annotation clicked")
        if let person = view.annotation as? PersonAnnotation {
            openDetails(for: person)
        }
       
    }
}

