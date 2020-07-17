//
//  Models.swift
//  git_project
//
//  Created by MacBook Pro on 7/8/20.
//  Copyright © 2020 MacBook Pro. All rights reserved.
//

import Foundation

struct DataModel<T: Codable>: Codable {
    let success: Bool
    let messages: [MessageModel]
    let data: T
}

struct MessageModel:Codable {
    let key: Int
    let value: String?
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

struct ReciepeModel: Codable {
    let id: Int
    let name: String
}


struct ReciepesModel: Codable {
    let recipes: [Reciepe]
}

struct Reciepe: Codable {
    let id: Int
    let name: String
    let photo: String?
    let igredientsCount, preparationTime, categoryID: Int
    let categoryName: String

    enum CodingKeys: String, CodingKey {
        case id, name, photo, igredientsCount, preparationTime
        case categoryID = "categoryId"
        case categoryName
    }
}

struct MyAccountDetail: Codable {
    let id: String
    var name: String
    var email: String
    var surname: String
    let address: Address
    let photo: String?
    let role: String
    let phone: String
    let birthDate: String
    var dateOfBirth: String?
}

// MARK: - DataClass
struct DataClass: Codable {
    let additionalCards: [AdditionalCard]
}

// MARK: - AdditionalCard
struct AdditionalCard: Codable {
    let cardNumber: String
    let bonusCardType: Int
    let owner: Owner
}

// MARK: - Owner
struct Owner: Codable {
    let name, surname: String
    let photo: String?
}

// MARK: - Message
struct Message: Codable {
    let key: Int
    let value: String
}

struct BonusCard: Codable {

let cardNumber: String
let balance: Int
let monthAmount: Int
let loyaltyLevel: Int
let bonusCardType: Int
let status: Int
}

// MARK: - DataClass
struct GetALLWebModel: Codable {
    let stores: [Store]
}

// MARK: - Store
struct Store: Codable {
    let name, address: String
    let isInMall: Bool
    let phoneNumber: String?
    let startTime: String
    let endTime: String
    
    let lat, lng: Double
    let photo: String?
    let cityID: Int
    
    var getWorkingHours: String {
        get {
            if endTime == startTime {
                return "24/7"
            }
            return startTime + " - " + endTime
        }
        
    }

    enum CodingKeys: String, CodingKey {
        case name, address, isInMall, phoneNumber, startTime, endTime, lat, lng, photo
        case cityID = "cityId"
    }
}

// MARK: - DataClass
struct GetBrandModel: Codable {
    let brands: [Brand]
}

// MARK: - Brand
struct Brand: Codable {
    let id, itemCount: Int
    let name: String
    let photo: String?
}

// MARK: - DataClass
struct TrendingBrandModel: Codable {
    let brands: [Brand]
}

struct Countries: Codable {
    let list: [List]
}

struct List: Codable {
    let id, name, code: String
}


extension Encodable {
  var dictionary: [String: Any]? {
    guard let data = try? JSONEncoder().encode(self) else { return nil }
    return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
  }
}

struct GetById: Codable {
    let success: Bool
    let data: [Data]
    
}

struct Data: Codable {
    let addressId: Int
    let city: String
    let street: String
    let buliding: String
    let entrance: Int
    let floor: Int
    let appartment: Int
    let phoneNumber: Int
    let commentToDriver: String
}

struct Brands: Codable {
    let brands: [Brand]
}

struct Brand: Codable {
    let id: Int
    let itemCount: Int
    let name: String
    let photo: String?
}

struct GetAdditionalCards: Codable {
    
    let additionalCards: [AdditionalCards]
}

struct AdditionalCards: Codable {
    
    let cardNumber: String
    let bonusCardType: Int
    let owner: Owner
}

struct Owner: Codable {
    
    let name: String
    let surname: String
    let photo: String?
}


struct CardInfo: Codable {
    
      let cardNumber: String
      let balance: Double
      let monthAmount: Double
      let loyaltyLevel: Int
      let bonusCardType: Int
      let status: Int
}
 
struct FavoriteProducts: Codable {
    
}

struct StoreGetAllWeb: Codable {
    let stores: [Stores]
    
}

struct Stores: Codable {
    let name: String
    let address: String
    let isInMall: Bool
    let phoneNumber: String?
    let startTime: String
    let endTime: String
    let lat: Double
    let lng: Double
    let photo: String?
    let cityId: Int
    
    enum CodingKeys: String, CodingKey {
          case name, address, isInMall, phoneNumber, startTime, endTime//, workingHours
          case lat, lng, photo
          case cityId = "cityId"
      }
}

struct TenderById {
    let data: String?
}

struct Countries: Codable {
    let list: [List]
}

struct List: Codable {
    let id, name, code: String
}


struct SearchModel: Codable {
    var search: String
}
