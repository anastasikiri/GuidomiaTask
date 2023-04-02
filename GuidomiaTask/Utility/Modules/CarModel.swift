//
//  CarModel.swift
//  GuidomiaTask
//
//  Created by Kyrylo Tokar on 2023-04-02.
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
}
