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
    
    var userInfo: User?
    
    override func loadView() {
        view = detailView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
    }
   

}
