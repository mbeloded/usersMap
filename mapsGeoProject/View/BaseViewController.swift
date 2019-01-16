//
//  BaseViewController.swift
//  mapsGeoProject
//
//  Created by Michael Bielodied on 1/13/19.
//  Copyright © 2019 Michael Bielodied. All rights reserved.
//

import UIKit

protocol BaseVCProtocol {
    func rightButtonAction()
    func backButtonAction()
    func loadData()
}

class BaseViewController: UIViewController, BaseVCProtocol {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupNavigationStyle()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(image: UIImage(named: "ic_restart"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(rightButtonAction))
        
        //self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "reload.title".localized, style: UIBarButtonItem.Style.plain, target: self, action: #selector(rightButtonAction))
        
        self.view.backgroundColor = .Secondary1

    }
    
    fileprivate func setupNavigationStyle() {
        
        navigationController?.setNavigationBarHidden(false, animated: false)
        
        UIBarButtonItem.appearance(whenContainedInInstancesOf: [UINavigationController.self]).tintColor = .navigationBarItemsTintColor
        
        UINavigationBar.appearance(whenContainedInInstancesOf: [UINavigationController.self]).backgroundColor = .navigationBackgroundColor
    }
    
    @objc func rightButtonAction() {
        //
        print("rightButtonAction")
    }
    
    @objc func backButtonAction() {
        //
        print("backButtonAction")
    }
    
    func loadData() {
        //
        print("loadData")
        
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
