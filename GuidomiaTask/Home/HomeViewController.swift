//
//  HomeViewController.swift
//  GuidomiaTask
//
//  Created by Anastasia Bilous on 2023-04-02.
//

import UIKit

class HomeViewController: UIViewController {
    
    private var viewModel: HomeViewModelProtocol = HomeViewModel(api: APIHelper())
    private var cars = [CarModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cars = viewModel.loadData()
    }


}

