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
    
    let getAllEndPoint = "Address/GetAll"
    let getReciepeEndPoint = "Recipes/GetRecipeCategorys"
    let getSimilarReciepeEndPoint = "Recipes/GetSimilarRecipes"
<<<<<<< HEAD
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
=======
    let getAdditionalCardsEndPoint = "BonusCard/GetAdditionalCards"
    let getBonusInfoEndPoint = "BonusCard/GetBonusInfo"
    let getAllWebEndPoint = "Store/GetAllWeb"
    let getBrandEndPoint = "Brand/GetBrand"
    let getTrendingBrandEndPoint = "Brand/GetTrendingBrand"
    let getCountriesEndPoint = "Country/GetAll"

>>>>>>> 5c5b2183cef9cabfa9621548a8abe6a6c98fcaaf
    


    var array = [ReciepeModel]()
    
    var similarArray = [Reciepe]()
    
    var addressesArray = [Address]()
    
<<<<<<< HEAD
    var brands = [Brand]()
     
    var additionalCards = [AdditionalCards]()
    
    var storeAllWeb = [Stores]()
=======
    var additionalCard = [AdditionalCard]()
    
    var bonusInfo: BonusCard?
    
    var stores = [Store]()
    
    var brands = [Brand]()
    
    var trendingBrands = [Brand]()
    
>>>>>>> 5c5b2183cef9cabfa9621548a8abe6a6c98fcaaf
    var countries = [List]()
    

    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var searchTxtField: UITextField!
    @IBOutlet weak var addressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
<<<<<<< HEAD
=======
   //     makeRequest()
>>>>>>> 5c5b2183cef9cabfa9621548a8abe6a6c98fcaaf
        delegates()
        txtFieldDelagate()
        makeAnotherRequest()
        getAllAddresses()
        getSimilarRequest()
<<<<<<< HEAD
        getMyAccount()
        req()
        getAdditionalCards()
        getBonusCardInfo()
        getFavoriteProducts()
        getStoreAllWeb()
        getCountriesWithSearch()
=======
        getAdditionalCards()
        getBonusInfo()
        getAllWeb()
        getBrand()
        getTrendingBrand()
        getCountriesWithSearch()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .done, target: self, action: #selector(addTapped))
>>>>>>> 5c5b2183cef9cabfa9621548a8abe6a6c98fcaaf
    }
    
    private func delegates() {
        table.delegate = self
        table.dataSource = self
    }
    
<<<<<<< HEAD
    private func txtFieldDelagate() {
        searchTxtField.delegate = self
        searchTxtField.addTarget(self, action: #selector(valueChanged), for: .editingChanged)
    }
    
    @objc func valueChanged() {
        getCountriesWithSearch()
    }
    
    func makeRequest() {
=======
    @objc func addTapped() {
        let vc = UIStoryboard(name: "CreateAddress", bundle: nil).instantiateViewController(identifier: "CreateAddressViewController") as! CreateAddressViewController
        vc.delegate = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func getAllAddresses() {
>>>>>>> 5c5b2183cef9cabfa9621548a8abe6a6c98fcaaf
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
    
    func getAdditionalCards() {
        APIClientService.makeRequest(urlEndPoint: getAdditionalCardsEndPoint ) { (resp: DataClass) in
            self.additionalCard = resp.additionalCards
            self.table.reloadData()
        }
    }
    
<<<<<<< HEAD
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
=======
    func getBonusInfo() {
        APIClientService.makeRequest(urlEndPoint: getBonusInfoEndPoint ) { (resp: BonusCard) in
            self.bonusInfo = resp
            self.table.reloadData()
        }
    }
    func getAllWeb() {
        APIClientService.makeRequest(urlEndPoint: getAllWebEndPoint) { (resp: GetALLWebModel) in
            self.stores = resp.stores
            self.table.reloadData()
        }
    }
    
    func getBrand() {
        APIClientService.makeRequest(urlEndPoint: getBrandEndPoint) { (resp: GetBrandModel) in
                self.brands = resp.brands
                self.table.reloadData()
        }
    }
    
    func getTrendingBrand() {
        APIClientService.makeRequest(urlEndPoint: getTrendingBrandEndPoint) { (resp: TrendingBrandModel ) in
            self.trendingBrands = resp.brands
>>>>>>> 5c5b2183cef9cabfa9621548a8abe6a6c98fcaaf
            self.table.reloadData()
        }
    }
    
<<<<<<< HEAD
    func getCountriesWithSearch() {
        var searchModel = SearchModel(search: "sakjdjbv")
        searchModel.search = searchTxtField.text ?? ""
        APIClientService.makeRequest(urlEndPoint: getCountriesEndPoint, method: .post, params: searchModel.asDictionary()) { (resp: Countries) in
            self.countries = resp.list
            self.table.reloadData()
        }
=======
    func getCountriesWithSearch(){
        let dict = ["search": "z"]
        APIClientService.makeRequest(urlEndPoint: getCountriesEndPoint, method: .post, params: dict) {(resp: Countries) in
            self.countries = resp.list
            self.table.reloadData()
        }
        
>>>>>>> 5c5b2183cef9cabfa9621548a8abe6a6c98fcaaf
    }
}
extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
<<<<<<< HEAD
        return 7
=======
        return 9
>>>>>>> 5c5b2183cef9cabfa9621548a8abe6a6c98fcaaf
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
<<<<<<< HEAD
            return 0//similarArray.count
        } else if section == 3 {
            return 0//brands.count
        } else if section == 4 {
            return additionalCards.count
        } else if section == 5 {
            return storeAllWeb.count
        } else {
            return array.count
=======
            return similarArray.count
        } else if section == 3 {
            return additionalCard.count
        } else if section == 4 {
            return 1
        } else if section == 5 {
            return stores.count
        } else if section == 6 {
            return 0//brands.count
        } else if section == 7{
            return trendingBrands.count
        } else {
            return 0//countries.count
>>>>>>> 5c5b2183cef9cabfa9621548a8abe6a6c98fcaaf
        }
    
    }
    
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
<<<<<<< HEAD
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
=======
        if indexPath.section == 0 {
            cell.titleLbl.text = String(array[indexPath.row].id)
            //cell.valueLbl.text = array[indexPath.row].name
        } else if indexPath.section == 1 {
            cell.titleLbl.text = addressesArray[indexPath.row].city
            cell.streetlbl.text = addressesArray[indexPath.row].street
            cell.phonelbl.text = addressesArray[indexPath.row].phoneNumber
        } else if indexPath.section == 2 {
            cell.titleLbl.text = String(similarArray[indexPath.row].id)
            cell.valueLbl.text = similarArray[indexPath.row].name
        } else if indexPath.section == 3 {
            cell.titleLbl.text = additionalCard[indexPath.row].cardNumber
            cell.valueLbl.text = additionalCard[indexPath.row].owner.name
        } else if indexPath.section == 4 {
            cell.titleLbl.text = bonusInfo?.cardNumber
            cell.valueLbl.text = String(bonusInfo?.loyaltyLevel ?? 0)
        } else if indexPath.section == 5 {
            cell.titleLbl.text = stores[indexPath.row].name
            cell.valueLbl.text = String(stores[indexPath.row].getWorkingHours)
        } else if indexPath.section == 6 {
            cell.titleLbl.text = brands[indexPath.row].name
            cell.valueLbl.text = String(brands[indexPath.row].id)
        } else if indexPath.section == 7 {
            cell.titleLbl.text = String(brands[indexPath.row].id)
            cell.valueLbl.text = String(brands[indexPath.row].name)
        } else {
            cell.titleLbl.text = String(brands[indexPath.row].id)
            cell.valueLbl.text = String(brands[indexPath.row].name)
>>>>>>> 5c5b2183cef9cabfa9621548a8abe6a6c98fcaaf
        }
        
        return cell
    }
}


extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        getCountriesWithSearch()
        return true
    }
    
<<<<<<< HEAD
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
=======
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath == IndexPath(row: 0, section: 1) {
            let vc = UIStoryboard(name: "MyAccount", bundle: nil).instantiateViewController(identifier: "MyAccountViewController") as! MyAccountViewController
            self.navigationController?.pushViewController(vc, animated: true)
        } else if indexPath.section == 1 {
            let vc = UIStoryboard(name: "CreateAddress", bundle: nil).instantiateViewController(identifier: "CreateAddressViewController") as! CreateAddressViewController
            vc.address = addressesArray[indexPath.row]
            vc.delegate = self
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
>>>>>>> 5c5b2183cef9cabfa9621548a8abe6a6c98fcaaf
}


    

extension ViewController: AddressDelegate {
    func addressDidAdd() {
        getAllAddresses()
    }
}


