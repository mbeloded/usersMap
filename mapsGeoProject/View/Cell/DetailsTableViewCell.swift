//
//  DetailsTableViewCell.swift
//  mapsGeoProject
//
//  Created by Michael Bielodied on 1/13/19.
//  Copyright © 2019 Michael Bielodied. All rights reserved.
//

import UIKit

class DetailsTableViewCell: UITableViewCell {

    //MARK: variables
    
    var locationDetails: LocationDetails? {
        didSet {
            titleLabel?.text = locationDetails?.title
            descriptionLabel?.text = locationDetails?.description
            dateTimeLabel?.text = locationDetails?.timeStamp
        }
    }
    
    //MARK: outlets
    @IBOutlet weak var view: UIView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateTimeLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
