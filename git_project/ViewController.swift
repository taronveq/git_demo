//
//  ViewController.swift
//  git_project
//
//  Created by MacBook Pro on 6/22/20.
//  Copyright © 2020 MacBook Pro. All rights reserved.
//
 
//
//
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.allHTTPHeaderFields = ["Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJlZDNlZWYwMC04ZWJkLTRjYmEtOGI1ZS0yODBhOTA2YjAxYjIiLCJ1bmlxdWVfbmFtZSI6IiszNzQ5NDE3MjgzOSIsImp0aSI6IjFlNTBkZTVmLTdiMDAtNGEwYS1iYjc5LTVlM2YyOGNmYjJmOCIsImlhdCI6MTU5MzE1NTQ0MiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiVXNlciIsIm5iZiI6MTU5MzE1NTQ0MiwiZXhwIjoxNjAxNzk1NDQyLCJpc3MiOiJ3ZWJBcGkiLCJhdWQiOiJodHRwOi8vbG9jYWxob3N0OjUwMDIvIn0.Ppl7oRQ1UEzor61KQW8tJAANX2Pf7dnbu0J18hZhd4I"]
import UIKit

class ViewController: UIViewController {

    let baseUrl = "https://cityshopapi.abmdemo.me/api/"
    let addressCreate = "Address/Create"
    let addressAll = "Address/GetAll"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // 1 Step
        guard let url = URL(string: baseUrl + addressCreate) else {
            return
        }
        
        // 2 Step
        var request = URLRequest(url: url)
        
        // 3 Step
        request.httpMethod = "POST"
        
        // 4 Step
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJlZDNlZWYwMC04ZWJkLTRjYmEtOGI1ZS0yODBhOTA2YjAxYjIiLCJ1bmlxdWVfbmFtZSI6IiszNzQ5NDE3MjgzOSIsImp0aSI6IjFlNTBkZTVmLTdiMDAtNGEwYS1iYjc5LTVlM2YyOGNmYjJmOCIsImlhdCI6MTU5MzE1NTQ0MiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiVXNlciIsIm5iZiI6MTU5MzE1NTQ0MiwiZXhwIjoxNjAxNzk1NDQyLCJpc3MiOiJ3ZWJBcGkiLCJhdWQiOiJodHRwOi8vbG9jYWxob3N0OjUwMDIvIn0.Ppl7oRQ1UEzor61KQW8tJAANX2Pf7dnbu0J18hZhd4I", forHTTPHeaderField: "Authorization")
        request.setValue("hy", forHTTPHeaderField: "en")
        
        
        // 5 Step
        let parameters: [String: Any] = [
            "city": "Gyumri",
            "street": "Paruyr Sevak",
            "entrance": 10
        ]
        do {
            let data = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
            request.httpBody = data
            
            
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
                        
                        guard let success = dict["success"] as? Int else { return }
                        if success == 1 {
                            print("Success")
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
            
        } catch {
            print(error.localizedDescription)
        }
        
        do {
            try x()
        } catch {
            error
        }
    }

    
    func x() throws -> Int {
        return 10
    }

}

