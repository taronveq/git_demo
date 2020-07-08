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

struct ReciepeModel: Codable {
    let id: Int
    let name: String
}


struct ReciepesModel: Codable {
    let recipes: [Reciepe]
}

// MARK: - Recipe
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
