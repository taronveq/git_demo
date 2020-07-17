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
    let getAdditionalCardsEndPoint = "BonusCard/GetAdditionalCards"
    let getBonusInfoEndPoint = "BonusCard/GetBonusInfo"
    let getAllWebEndPoint = "Store/GetAllWeb"
    let getBrandEndPoint = "Brand/GetBrand"
    let getTrendingBrandEndPoint = "Brand/GetTrendingBrand"
    let getCountriesEndPoint = "Country/GetAll"
    
    let getInterestedEndPoint = "Product/GetInterested"
    
    let addToFavoriteEndPoint = "Favorites/AddToFavorite"
    let getFavoritesEndPoint = "Favorites/GetFavoriteProducts"
    let deleteFavoriteEndPoint = "Favorites/RemoveFromFavorite"

    
    var array = [ReciepeModel]()
    
    var similarArray = [Reciepe]()
    
    var addressesArray = [Address]()
    
    var additionalCard = [AdditionalCard]()
    
    var bonusInfo: BonusCard?
    
    var stores = [Store]()
    
    var brands = [Brand]()
    
    var trendingBrands = [Brand]()
    
    var countries = [List]()
    
    var products = [ProductList]()
    
    var favorites = [FavoriteProductModel]()
    

    @IBOutlet weak var table: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
   //     makeRequest()
        delegates()
        makeAnotherRequest()
        getAllAddresses()
        getSimilarRequest()
        getAdditionalCards()
        getBonusInfo()
        getAllWeb()
        getBrand()
        getTrendingBrand()
        getCountriesWithSearch()
        getAllFavorites()
        getInterestedProducts()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .done, target: self, action: #selector(addTapped))
    }
    
    private func delegates() {
        table.delegate = self
        table.dataSource = self
    }
    
    @objc func addTapped() {
        let vc = UIStoryboard(name: "CreateAddress", bundle: nil).instantiateViewController(identifier: "CreateAddressViewController") as! CreateAddressViewController
        vc.delegate = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func addToFavorite(id: String) {
        APIClientService.makeRequest(urlEndPoint: addToFavoriteEndPoint + "?id=" + id, method: .post) { (resp: Bool) in
            if resp {
                self.getAllFavorites()
            }
        }
    }
    
    func getAllFavorites() {
        APIClientService.makeRequest(urlEndPoint: getFavoritesEndPoint) { (resp: [FavoriteProductModel]) in
            self.favorites = resp
            self.table.reloadData()
        }
    }
    
    func deleteFavorite(id: String) {
        APIClientService.makeRequest(urlEndPoint: deleteFavoriteEndPoint + "?id=" + id, method: .delete) { (resp: Bool) in
            if resp {
                self.getAllFavorites()
            }
        }
    }
    
    func getInterestedProducts() {
        let dict = ["page": 1, "count": 10]
        APIClientService.makeRequest(urlEndPoint: getInterestedEndPoint, method: .post, params: dict) { (resp: Products) in
            self.products = resp.list
            self.table.reloadData()
        }
    }
    
    func getAllAddresses() {
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
    
    func getAdditionalCards() {
        APIClientService.makeRequest(urlEndPoint: getAdditionalCardsEndPoint ) { (resp: DataClass) in
            self.additionalCard = resp.additionalCards
            self.table.reloadData()
        }
    }
    
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
            self.table.reloadData()
        }
    }
    
    func getCountriesWithSearch(){
        let dict = ["search": "z"]
        APIClientService.makeRequest(urlEndPoint: getCountriesEndPoint, method: .post, params: dict) {(resp: Countries) in
            self.countries = resp.list
            self.table.reloadData()
        }
        
    }
    @IBAction func favoriteBtnAction(_ sender: UIButton) {
        
        let id = products[sender.tag].id
        for value in favorites {
            if value.id == id {
                deleteFavorite(id: String(id))
                return
            }
        }
        addToFavorite(id: String(id))
    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 11
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return array.count
        } else if section == 1 {
            return addressesArray.count
        } else if section == 2 {
            return similarArray.count
        } else if section == 3 {
            return additionalCard.count
        } else if section == 4 {
            return 1
        } else if section == 5 {
            return stores.count
        } else if section == 6 {
            return 0//brands.count
        } else if section == 7 {
            return trendingBrands.count
        } else if section == 8 {
            return 0//countries.count
        } else if section == 9 {
            return products.count
        } else {
            return favorites.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
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
        } else if indexPath.section == 8 {
            cell.titleLbl.text = String(brands[indexPath.row].id)
            cell.valueLbl.text = String(brands[indexPath.row].name)
        } else if indexPath.section == 9 {
            cell.titleLbl.text = products[indexPath.row].name
            cell.valueLbl.text = String(products[indexPath.row].price)
            cell.editBtn.tag = indexPath.row
        } else {
            cell.titleLbl.text = favorites[indexPath.row].name
            cell.valueLbl.text = String(favorites[indexPath.row].price)
        }
        
        return cell
    }
    
    
    
    
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
}


    

extension ViewController: AddressDelegate {
    func addressDidAdd() {
        getAllAddresses()
    }
}


