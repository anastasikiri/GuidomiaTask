//
//  HomeViewController.swift
//  GuidomiaTask
//
//  Created by Anastasia Bilous on 2023-04-02.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var viewModel: HomeViewModelProtocol = HomeViewModel(api: APIHelper())
    private var cars = [CarModel]()
    private var promotions = [CarPromotionModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cars = viewModel.loadCarData()
        promotions = viewModel.loadPromotionData()
        
        registerCell(reuseId: String(describing: PromotionTableViewCell.self))
        registerCell(reuseId: String(describing: CarTableViewCell.self))
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func registerCell(reuseId: String) {
        tableView.register(UINib(nibName: reuseId, bundle: nil),
                           forCellReuseIdentifier: reuseId)
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension HomeViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return promotions.count
        case 1: return cars.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let reuseId = String(describing: PromotionTableViewCell.self)
            
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: reuseId,
                for: indexPath) as? PromotionTableViewCell else { fatalError() }
            
            cell.configure(with: promotions[indexPath.row])
            
            return cell
        case 1:
            let reuseId = String(describing: CarTableViewCell.self)
            
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: reuseId,
                for: indexPath) as? CarTableViewCell else { fatalError() }
            
            cell.configure(with: cars[indexPath.row])
            
            return cell
        default:
            fatalError("Invalid section")
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
}

