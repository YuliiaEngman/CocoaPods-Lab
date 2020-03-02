//
//  APIClient.swift
//  CocoaPods-Lab
//
//  Created by Yuliia Engman on 3/1/20.
//  Copyright © 2020 Yuliia Engman. All rights reserved.
//

import Foundation
import Alamofire

struct APIClient {
    
    // Result<Cocktail, Error>
    static func fetchUserIUnfo(completion: @escaping (AFResult<[User]>) -> ()) {
        let endpointURLString = "https://randomuser.me/api/?results=500"
        
        // we need a URL
        guard let url = URL(string: endpointURLString) else {
            return
        }
        
        AF.request(url).response { (response) in
            //response.data
            //response.error
            //response.request
            if let error = response.error {
                completion(.failure(error))
            } else if let data = response.data {
                do {
                    let results = try JSONDecoder().decode(ResultsWrapper.self, from: data)
                    let users = results.results
                    completion(.success(users))
                } catch {
                    //completion(.failure(error))
                    print("\(error)")
                }
            }
        }
    }
}
