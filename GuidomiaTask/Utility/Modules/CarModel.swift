//
//  CarModel.swift
//  GuidomiaTask
//
//  Created by Anastasia Bilous on 2023-04-02.
//

import Foundation

struct CarModel : Codable {
    let consList: [String]
    let customerPrice: Double
    let make: String
    let marketPrice: Double
    let model: String
    let prosList: [String]
    let rating: Int
    
    var customerPriceString: String {
        return "Price: " + String(Int(customerPrice) / 1000) + "k"
    }
}
