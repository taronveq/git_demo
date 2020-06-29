//
//  ViewController.swift
//  git_project
//
//  Created by MacBook Pro on 6/22/20.
//  Copyright © 2020 MacBook Pro. All rights reserved.
//
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
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
        
        // 1 Step
        guard let url = URL(string: baseUrl + addressAll) else {
            return
        }
        
        // 2 Step
        var request = URLRequest(url: url)
        
        // 3 Step
        request.httpMethod = "GET"
        
        // 4 Step
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJlZDNlZWYwMC04ZWJkLTRjYmEtOGI1ZS0yODBhOTA2YjAxYjIiLCJ1bmlxdWVfbmFtZSI6IiszNzQ5NDE3MjgzOSIsImp0aSI6IjFlNTBkZTVmLTdiMDAtNGEwYS1iYjc5LTVlM2YyOGNmYjJmOCIsImlhdCI6MTU5MzE1NTQ0MiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiVXNlciIsIm5iZiI6MTU5MzE1NTQ0MiwiZXhwIjoxNjAxNzk1NDQyLCJpc3MiOiJ3ZWJBcGkiLCJhdWQiOiJodHRwOi8vbG9jYWxob3N0OjUwMDIvIn0.Ppl7oRQ1UEzor61KQW8tJAANX2Pf7dnbu0J18hZhd4I", forHTTPHeaderField: "Authorization")
        
        
        // 5 Step
        //        let parameters: [String: Any] = [
        //            "city": "Gyumri",
        //            "street": "Paruyr Sevak",
        //            "entrance": 10
        //        ]
        //        do {
        //            let data = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
        //            request.httpBody = data
        
        
        // 6 Step
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            // 8 Step Error Handle
            guard let d = data, let r = response as? HTTPURLResponse, error == nil else {
                print("Something went wrong")
                return
            }
            // 9 Step Check Status
            if r.statusCode >= 200 && r.statusCode <= 399 {
                
                // 10 Step Parse to dictionary
                do {
                    guard let dict = try JSONSerialization.jsonObject(with: d, options: []) as? [String: Any] else { return }
                    print(dict)
                    
                    guard let data = dict["data"] as? [String: Any],  let addresses = data["addresses"] as? [[String: Any]] else { return }
                    for value in addresses {
                        if let address = value["street"] as? String {
                            self.array.append(address)
                        }
                    }
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                    
                    
                } catch {
                    print(error)
                }
                
            } else {
                print(r.statusCode, "Bye")
            }
            
            
            
        }
        
        // 7 Step
        task.resume()
        
        //        } catch {
        //            print(error.localizedDescription)
        //        }
        
    }
    
    //    func x() throws -> Int {
//        return 10
//    }

}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddressTableViewCell", for: indexPath) as! AddressTableViewCell
        cell.setAddress(array[indexPath.row])
        return cell
    }
    
    
}
