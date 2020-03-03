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
    
    
    public var users = [User]() {
       didSet {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
       }
     }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
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

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
        let detailVC = DetailViewController()
        guard let indexPath = tableView.indexPathForSelectedRow else {
            fatalError("could not downcast to DetailViewController")
        }
        let userInfo = users[indexPath.row]
        detailVC.userInfo = userInfo
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

//override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//       guard let detailVC = segue.destination as? DetailViewController, let indexPath = tableView.indexPathForSelectedRow else {
//           fatalError("could not downcast to DetailViewController")
//       }
//       let someElements = elements[indexPath.row]
//       detailVC.oneElement = someElements
//   }

