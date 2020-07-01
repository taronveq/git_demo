//
//  ViewController.swift
//  git_project
//
//  Created by MacBook Pro on 6/22/20.
//  Copyright © 2020 MacBook Pro. All rights reserved.
//
import UIKit
import Alamofire


class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var addressesArray = [AddressModel]()
    
    var array = [String]()
    
    let baseUrl = "https://cityshopapi.abmdemo.me/api/"
    let addressCreate = "Address/Create"
    let addressAll = "Address/GetAll"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewDelagates()
        doRequest()
    }

    private func tableViewDelagates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func doRequest() {
//        let addr = AddressReqModel(title: "", description: "")
//        addr.dictionary
        guard let url = URL(string: baseUrl + addressAll) else {
            return
        }
        
        let alamofireSessionManager = Alamofire.Session.default
        
        alamofireSessionManager.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: getHeaders()).responseJSON { (response) in
            
            switch response.result {
            case .success(let value):
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: value, options: .prettyPrinted)

                    let responseData = try JSONDecoder().decode(ResponseModel.self, from: jsonData)

                    if responseData.success {
                        self.addressesArray = responseData.data.addresses
                        self.tableView.reloadData()
                        return
                    }
//                    completion(.failure(responseData.message))

                } catch {
//                    completion(.failure(error.localizedDescription))
                    debugPrint("Error parsing response data to JSON: \(error)")
                }
            case .failure(let error):
                if let statusCode = response.response?.statusCode {
//                    logOutIfNeeded(statusCode: statusCode)
                    return
                }

//                completion(.failure("Server error"))
                debugPrint(error.localizedDescription)
            }
        }
    }
    
    func getHeaders() -> HTTPHeaders {
        return ["Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJlZDNlZWYwMC04ZWJkLTRjYmEtOGI1ZS0yODBhOTA2YjAxYjIiLCJ1bmlxdWVfbmFtZSI6IiszNzQ5NDE3MjgzOSIsImp0aSI6IjlhZTJiYTc3LWJmYTctNDM4YS1hNzNkLWI1OGU0MDBkZjUyZCIsImlhdCI6MTU5MzU4ODcxNiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiVXNlciIsIm5iZiI6MTU5MzU4ODcxNSwiZXhwIjoxNjAyMjI4NzE1LCJpc3MiOiJ3ZWJBcGkiLCJhdWQiOiJodHRwOi8vbG9jYWxob3N0OjUwMDIvIn0.LYm2DVIZTdnu7IhR-QKd1yS8-lNSK4IF1uSh1QphmB"]
    }
    
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return addressesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddressTableViewCell", for: indexPath) as! AddressTableViewCell
        cell.setAddress(addressesArray[indexPath.row])
        return cell
    }
    
    
}


struct ResponseModel: Codable {
    let success: Bool
//    let message: [MessageModel]
    let data: DataModel
}


struct MessageModel: Codable {
    let key: Int
    let value: String
}

struct DataModel: Codable {
    let addresses: [AddressModel]
}

struct AddressModel: Codable {
    let addressId: Int
    let appartment: Int?
    let buliding: String?
    let city, commentToDriver: String?
    let entrance, floor: Int?
    let phoneNumber, street: String?
    let isDefault: Bool?
}


struct AddressReqModel: Codable {
    let title: String
    let description: String
}

extension Encodable {
  var dictionary: [String: Any]? {
    guard let data = try? JSONEncoder().encode(self) else { return nil }
    return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
  }
}
