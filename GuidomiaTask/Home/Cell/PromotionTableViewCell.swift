//
//  PromotionTableViewCell.swift
//  GuidomiaTask
//
//  Created by Anastasia Bilous on 2023-04-02.
//

import UIKit

class PromotionTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var carImage: UIImageView!
    @IBOutlet private weak var carModelLabel: UILabel!
    @IBOutlet private weak var carDescriptionLabel: UILabel!
    
    func configure(with title: CarPromotionModel) {
        carImage.image = UIImage(named: title.carImage)
        carModelLabel.text = title.carModel
        carDescriptionLabel.text = title.carDescription
    }    
}
