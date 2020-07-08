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
    
    let getAllEndPoint = "Address/GetAll"
    let getReciepeEndPoint = "Recipes/GetRecipeCategorys"
    let getSimilarReciepeEndPoint = "Recipes/GetSimilarRecipes"

    
    var array = [ReciepeModel]()
    
    var similarArray = [Reciepe]()
    
    var addressesArray = [Address]()
    

    @IBOutlet weak var table: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
//        makeRequest()
        delegates()
        makeAnotherRequest()
        makeRequest()
        getSimilarRequest()
    }
    
    private func delegates() {
        table.delegate = self
        table.dataSource = self
    }
    
    func makeRequest() {
        APIClientService.makeRequest(urlEndPoint: getAllEndPoint) { (resp: AddressModel) in
            print(resp)
            self.addressesArray = resp.addresses
            self.table.reloadData()
        }
    }
    
    
    func makeAnotherRequest() {
        APIClientService.makeRequest(urlEndPoint: getReciepeEndPoint) { (resp: [ReciepeModel]) in
            self.array = resp
            self.table.reloadData()
        }
    }
    
    func getSimilarRequest() {
        APIClientService.makeRequest(urlEndPoint: getSimilarReciepeEndPoint + "?recipeId=1") { (resp: ReciepesModel) in
            self.similarArray = resp.recipes
            self.table.reloadData()
        }
    }

}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return array.count
        } else if section == 1 {
            return addressesArray.count
        } else {
            return similarArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        if indexPath.section == 0 {
            cell.titleLbl.text = String(array[indexPath.row].id)
            cell.valueLbl.text = array[indexPath.row].name
        } else if indexPath.section == 1 {
            cell.titleLbl.text = addressesArray[indexPath.row].city
            cell.valueLbl.text = addressesArray[indexPath.row].phoneNumber
        } else {
            cell.titleLbl.text = String(similarArray[indexPath.row].id)
            cell.valueLbl.text = similarArray[indexPath.row].name
        }
        return cell
    }
}
