//
//  DetailsViewController.swift
//  mapsGeoProject
//
//  Created by Michael Bielodied on 1/13/19.
//  Copyright © 2019 Michael Bielodied. All rights reserved.
//

import UIKit

class DetailsViewController: BaseViewController {
    
    // MARK: variables
    fileprivate let defaultCellHeight = CGFloat(62)
    
    var person: PersonAnnotation?
    
    fileprivate var locationDetails: [LocationDetails]? {
        didSet {
            tableView.reloadData()
        }
    }
    
    //MARK: outlets
    @IBOutlet weak var personImage: UIImageView!
    @IBOutlet weak var personName: UILabel!
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.layoutMargins = .zero
            tableView.estimatedRowHeight = defaultCellHeight
            tableView.rowHeight = UITableView.automaticDimension
            tableView.registerCells(identifiers: [DetailsTableViewCell.identifierCell])
        }
    }

    override func viewDidLoad() {
    
        super.viewDidLoad()
        
        self.title = "user.locations.info.title".localized

        // Do any additional setup after loading the view.
        tableView.tableFooterView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: self.view.frame.width, height: 16))
        
        //update the top value & title
        // it'll be better to get user data by personID, instead of sending annotation here
        personImage?.image = person?.defPlaceholderImage
        personName?.text = person?.title
        
        loadData()
    }
    
    override func loadData() {
        //load data for personId
        
        guard let personId = person?.personId else {
            print("person id is empty")
            return
        }
        
        PersonService.shared.getLocationsFor(userId: personId) { [weak self] (result) in
            switch result {
            case .success(let locations) :
                // reload data
                self?.locationDetails = locations.map({return LocationDetails(_ : $0)})
                
                break
            case .failure(let error) :
                print("Result error \(error)")//show the error
                break
            }
        }
    }
    
    @objc override func rightButtonAction() {
        //
        loadData()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension DetailsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return locationDetails?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: DetailsTableViewCell.identifierCell) as! DetailsTableViewCell
            cell.locationDetails = locationDetails?[indexPath.row]
        return cell
    
    }
}
