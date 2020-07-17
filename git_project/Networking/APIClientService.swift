//
//  APIClientService.swift
//  git_project
//
//  Created by MacBook Pro on 7/8/20.
//  Copyright © 2020 MacBook Pro. All rights reserved.
//

import Foundation
import Alamofire


class APIClientService {
    
    static let manager = Alamofire.Session.default
    
    class func makeRequest<T: Codable>(urlEndPoint: String,
                                       method: HTTPMethod = .get,
                                       params: Parameters? = nil,
                                       encoding: JSONEncoding = JSONEncoding.default,
                                       completion: @escaping (T) -> Void) {
        
        let url = baseUrl + urlEndPoint
        manager.request(url, method: method, parameters: params, encoding: encoding, headers: Header.getHeaders()).responseJSON { (response) in

            switch response.result {
            case .success(let value):
                do {
                    
                    let jsonData = try JSONSerialization.data(withJSONObject: value, options: .prettyPrinted)
                    let responseData = try JSONDecoder().decode(DataModel<T>.self, from: jsonData)
                    if responseData.success {
                        completion(responseData.data)
                    }
                } catch {
                    print(error)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }
        
    }
    
}
