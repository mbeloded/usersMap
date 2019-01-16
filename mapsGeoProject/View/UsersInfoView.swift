//
//  UsersInfoView.swift
//  mapsGeoProject
//
//  Created by Michael Bielodied on 1/17/19.
//  Copyright © 2019 Michael Bielodied. All rights reserved.
//

import UIKit

class UsersInfoView: UIView {
    
    //MARK : variables
    
    var usersCnt: Int? {
        didSet {
            
            let animationPeriod: Float = 2
            if let _usersCnt = usersCnt {
                DispatchQueue.global(qos: .default).async(execute: {
                    for i in (_usersCnt-1..<1000).reversed() {
                        usleep(useconds_t(animationPeriod / 10 * 10000)) // sleep in microseconds
                        DispatchQueue.main.async(execute: { [weak self] in
                            self?.usersInfoLabel?.text = "\(i)"
                            self?.subtitleLabel?.text = "getting.users.label".localized
                        })
                    }
                    DispatchQueue.main.async(execute: { [weak self] in
                        self?.subtitleLabel?.text = "number.of.users.label".localized
                    })
                })
            }

        }
    }
    
    //MARK : outlets
    @IBOutlet weak var view: UIView!
    
    @IBOutlet weak var usersInfoLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupUI()
        
    }
    
    func setupUI() {
        Bundle.main.loadNibNamed("UsersInfoView", owner: self, options: nil)
        self.addSubview(self.view);    // adding the top level view to the view hierarchy
     
        self.layer.cornerRadius = self.view.bounds.height*0.5
        self.layer.masksToBounds = true
        
    }

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    
    }
    

}
