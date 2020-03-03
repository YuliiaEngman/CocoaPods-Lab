//
//  DetailViewController.swift
//  CocoaPods-Lab
//
//  Created by Yuliia Engman on 3/3/20.
//  Copyright © 2020 Yuliia Engman. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    private let detailView = DetailView()
    
    var userInfo: User!
    
    override func loadView() {
        view = detailView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        detailView.userNameLabel.text = "\(String(describing: userInfo.name.title)) \(String(describing: userInfo.name.first)) \(String(describing: userInfo.name.last))"
        detailView.dobLabel.text = String(userInfo.dob.date.prefix(10))
        detailView.addressLabel1.text = "\(String(describing: userInfo.location.street.number)) \(String(describing: userInfo.location.street.name))"
        detailView.addressLabel2.text = "\(String(describing: userInfo.location.city)), \(String(describing: userInfo.location.state)), \(String(describing: userInfo.location.postcode))"
        detailView.phoneLabel.text = "Phone: \(userInfo.phone)"
        detailView.emailLabel.text = "Email: \(userInfo.email)"
    }
}
