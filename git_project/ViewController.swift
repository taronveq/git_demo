//
//  ViewController.swift
//  git_project
//
//  Created by MacBook Pro on 6/22/20.
//  Copyright © 2020 MacBook Pro. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController{
    
    var array = [Address]()
    let manager = Alamofire.Session.default

    @IBOutlet weak var table: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        makeRequest()
        delegates()
    }
    
    private func delegates() {
        table.delegate = self
        table.dataSource = self
    }
    
    func getHeaders() -> HTTPHeaders {
        return ["Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJlZDNlZWYwMC04ZWJkLTRjYmEtOGI1ZS0yODBhOTA2YjAxYjIiLCJ1bmlxdWVfbmFtZSI6IiszNzQ5NDE3MjgzOSIsImp0aSI6ImIyNGQ4ZmNmLTZmNmMtNGMyNi1hNGE1LWEwNDRhYTg1ZThlNCIsImlhdCI6MTU5NDA0ODgyMSwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiVXNlciIsIm5iZiI6MTU5NDA0ODgyMCwiZXhwIjoxNjAyNjg4ODIwLCJpc3MiOiJ3ZWJBcGkiLCJhdWQiOiJodHRwOi8vbG9jYWxob3N0OjUwMDIvIn0.BVj87MQ0IPYfIHOBTQNz2GtBM0zRo9lQ0mhrBjNlXbE"]
    }
    
    func makeRequest() {
        let url = "https://citystaging.abmdemo.me/api/Address/GetAll"
        manager.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: getHeaders()).responseJSON { (response) in
                    
                    switch response.result {
                    case .success(let value):
                        print(value)
                        do {
                        let jsonData = try JSONSerialization.data(withJSONObject: value, options: .prettyPrinted)
                            let responseData = try JSONDecoder().decode(DataModel.self, from: jsonData)
                            self.array = responseData.data.addresses
                            self.table.reloadData()
                        } catch {
                            print(error)
                        }
                    case .failure(let error):
                        debugPrint(error.localizedDescription)
                    }

        }
    }


}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.titleLbl.text = array[indexPath.row].city
        cell.valueLbl.text = array[indexPath.row].phoneNumber
        return cell
    }
}






struct DataModel:Codable {
    let success: Bool
    let messages: [MessageModel]
    let data: AddressModel
}

struct MessageModel:Codable {
    let key: Int
    let value: String
}
struct  AddressModel:Codable {
    let addresses: [Address]
}
struct Address: Codable {
    let addressId: Int
    let city, street, buliding: String?
    let entrance, floor, appartment: Int?
    let phoneNumber, commentToDriver: String?
    let isDefault: Bool
    
}
