//
//  HomeViewModel.swift
//  GuidomiaTask
//
//  Created by Anastasia Bilous on 2023-04-02.
//

import Foundation

protocol HomeViewModelProtocol {
    func loadData() -> [CarModel]
}

class HomeViewModel: HomeViewModelProtocol {
    private let api: APIHelperProtocol
    
    init(api: APIHelperProtocol) {
        self.api = api
    }
    
    // MARK: - Public funcs
    func loadData() -> [CarModel] {
        return api.loadJson()
    }
}
