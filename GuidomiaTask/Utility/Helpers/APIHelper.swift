//
//  APIHelper.swift
//  GuidomiaTask
//
//  Created by Anastasia Bilous on 2023-04-02.
//

import Foundation

protocol APIHelperProtocol {
    func loadJson() -> [CarModel]
}

class APIHelper: APIHelperProtocol {
  
    private let fileName = "car_list"
    
    func loadJson() -> [CarModel] {
        guard let path = Bundle.main.path(forResource: fileName, ofType: "json") else { return [] }
        let url = URL(fileURLWithPath: path)
        
        do {
            let jsonData = try Data(contentsOf: url, options: .mappedIfSafe)
            let decoder = JSONDecoder()
            let result = try  decoder.decode([CarModel].self, from: jsonData)
            return result
        } catch {
            print("Error parsing JSON data: \(error)")
            return []
        }
    }
}
