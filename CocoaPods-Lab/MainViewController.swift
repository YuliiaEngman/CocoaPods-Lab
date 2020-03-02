//
//  MainViewController.swift
//  CocoaPods-Lab
//
//  Created by Yuliia Engman on 3/1/20.
//  Copyright © 2020 Yuliia Engman. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    private var users = [User]() {
       didSet {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
       }
     }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        getUsers()
    }
    
    private func getUsers() {
        APIClient.fetchUserIUnfo {[weak self] (result) in
            switch result {
            case .failure(let appError):
                print("error to load users \(appError)")
            case .success(let users):
                DispatchQueue.main.async {
                    self?.users = users
                }
            }
        }
    }
}

extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath)
        let user = users[indexPath.row]
        cell.textLabel?.text = "\(user.name.first) \(user.name.last)"
        cell.detailTextLabel?.text = user.email
        return cell
    }
}

