//
//  HomeViewModel.swift
//  GuidomiaTask
//
//  Created by Anastasia Bilous on 2023-04-02.
//

import Foundation

protocol HomeViewModelProtocol {
    func loadCarData() -> [CarModel]
    func loadPromotionData() -> [CarPromotionModel]
}

class HomeViewModel: HomeViewModelProtocol {
    private let api: APIHelperProtocol
    
    init(api: APIHelperProtocol) {
        self.api = api
    }
    
    // MARK: - Public funcs
    func loadCarData() -> [CarModel] {
        return api.getCarList()
    }
    
    func loadPromotionData() -> [CarPromotionModel] {
        return api.getCarPromotion()
    }
}
