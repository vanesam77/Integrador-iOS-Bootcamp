//
//  AlamofireAPIClient.swift
//  Integrador
//
//  Created by Vanesa Raquel Mizrahi on 18/09/2021.
//

import Foundation
import Alamofire

class AlamofireAPIClient{
    
    func get(url: String, completion: @escaping (Result<Data?,AFError>) -> Void) {
        AF.request(url).response { (response) in
            completion(response.result)
        }
    }
}
