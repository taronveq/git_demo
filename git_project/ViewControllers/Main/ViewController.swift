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
    let getMyAccountEndPoint = "Account/Get"
    let getByIdEndPoint = "Address/GetById/{id}"
    let getBrandsEndPoint = "Brand/GetBrand"
    let getTrendingBrand = "Brand/GetTrendingBrand"
    let getAdditionalCardsEndPoint = "BonusCard/GetAdditionalCards"
    let getBonusCardInfoEndPoint = "BonusCard/GetBonusInfo"
    let getFavoriteProductsEndPoint = "Favorites/GetFavoriteProducts"
    let getStoreAllWebEndPoint = "Store/GetAllWeb"
//    let getTenderByIdEndPoint = "Tender/GetById/{id}"
    let getCountriesEndPoint = "Country/GetAll"
    


    var array = [ReciepeModel]()
    
    var similarArray = [Reciepe]()
    
    var addressesArray = [Address]()
    
    var brands = [Brand]()
     
    var additionalCards = [AdditionalCards]()
    
    var storeAllWeb = [Stores]()
    var countries = [List]()
    

    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var searchTxtField: UITextField!
    @IBOutlet weak var addressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegates()
        txtFieldDelagate()
        makeAnotherRequest()
        makeRequest()
        getSimilarRequest()
        getMyAccount()
        req()
        getAdditionalCards()
        getBonusCardInfo()
        getFavoriteProducts()
        getStoreAllWeb()
        getCountriesWithSearch()
    }
    
    private func delegates() {
        table.delegate = self
        table.dataSource = self
    }
    
    private func txtFieldDelagate() {
        searchTxtField.delegate = self
        searchTxtField.addTarget(self, action: #selector(valueChanged), for: .editingChanged)
    }
    
    @objc func valueChanged() {
        getCountriesWithSearch()
    }
    
    func makeRequest() {
        APIClientService.makeRequest(urlEndPoint: getAllEndPoint) { (resp: AddressModel) in
            print(resp)
            self.addressesArray = resp.addresses
            self.table.reloadData()
        }
    }
    
    func req() {
        APIClientService.makeRequest(urlEndPoint: getBrandsEndPoint) { (resp: Brands) in
            self.brands = resp.brands
            self.table.reloadData()
        }
    }
    
    func reqTrendings() {
        APIClientService.makeRequest(urlEndPoint: "Brand/GetTrendingBrand") { (resp: Brands) in
            self.brands = resp.brands
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
        APIClientService.makeRequest(urlEndPoint: getSimilarReciepeEndPoint + "?recipeId=10989") { (resp: ReciepesModel?) in
            self.similarArray = resp?.recipes ?? []
            self.table.reloadData()
        }
    }
    
    func getAdditionalCards() {
           APIClientService.makeRequest(urlEndPoint: getAdditionalCardsEndPoint) { (resp: GetAdditionalCards) in
            self.additionalCards = resp.additionalCards
            self.table.reloadData()
        }
    }
    
    func getMyAccount() {
        APIClientService.makeRequest(urlEndPoint: getMyAccountEndPoint) { (resp: MyAccountDetail) in
            print(resp)
        }
    }
    
    func getBonusCardInfo() {
        APIClientService.makeRequest(urlEndPoint: getBonusCardInfoEndPoint) { (resp: CardInfo) in
           print(resp)
        }
    }
    
    func getFavoriteProducts() {
        APIClientService.makeRequest(urlEndPoint: getFavoriteProductsEndPoint) { (resp: FavoriteProducts) in
            print(resp)
        }
    }
    
    func getStoreAllWeb() {
        APIClientService.makeRequest(urlEndPoint: getStoreAllWebEndPoint) { (resp: StoreGetAllWeb) in
            self.storeAllWeb = resp.stores
            self.table.reloadData()
        }
    }
    
    func getCountriesWithSearch() {
        var searchModel = SearchModel(search: "sakjdjbv")
        searchModel.search = searchTxtField.text ?? ""
        APIClientService.makeRequest(urlEndPoint: getCountriesEndPoint, method: .post, params: searchModel.asDictionary()) { (resp: Countries) in
            self.countries = resp.list
            self.table.reloadData()
        }
    }
}
extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return countries.count
        } else if section == 1 {
            return addressesArray.count
        } else if section == 2 {
            return 0//similarArray.count
        } else if section == 3 {
            return 0//brands.count
        } else if section == 4 {
            return additionalCards.count
        } else if section == 5 {
            return storeAllWeb.count
        } else {
            return array.count
        }
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        switch indexPath.section {
        case 0:
            cell.titleLbl.text = countries[indexPath.row].code
            cell.valueLbl.text = countries[indexPath.row].name
        case 1:
            cell.titleLbl.text = addressesArray[indexPath.row].city
            cell.valueLbl.text = addressesArray[indexPath.row].phoneNumber
        case 2:
            cell.titleLbl.text = String(similarArray[indexPath.row].id)
            cell.valueLbl.text = similarArray[indexPath.row].name
        case 3:
            cell.titleLbl.text = String(brands[indexPath.row].id)
            cell.valueLbl.text = brands[indexPath.row].name
        case 4:
            cell.titleLbl.text = additionalCards[indexPath.row].cardNumber
            cell.valueLbl.text = additionalCards[indexPath.row].owner.name
        case 5:
            cell.titleLbl.text = storeAllWeb[indexPath.row].name
            cell.valueLbl.text = String(storeAllWeb[indexPath.row].cityId)
        case 6:
            cell.setData(model: array[indexPath.row])
        default:
            break
        }
        return cell
    }
}


extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        getCountriesWithSearch()
        return true
    }
    
}

extension Encodable {
  func asDictionary() -> [String: Any] {
    do {
        let data = try JSONEncoder().encode(self)
        guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
            return [:]
        }
        return dictionary
    } catch {
        return [:]
    }
  }
}
