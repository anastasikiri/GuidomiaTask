//
//  CarTableViewCell.swift
//  GuidomiaTask
//
//  Created by Anastasia Bilous on 2023-04-02.
//

import UIKit

class CarTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var carImage: UIImageView!
    @IBOutlet private weak var carModelLabel: UILabel!
    @IBOutlet private weak var carPriceLabel: UILabel!
    @IBOutlet var carRatingCollection: [UIImageView]!
    
    func configure(with car: CarModel) {
        carImage.image = UIImage(named: car.make)
        carModelLabel.text = car.make
        carPriceLabel.text = car.customerPriceString

        for i in 0 ..< car.rating {
            let image = UIImage(systemName: "star.fill")
            carRatingCollection[i].image = image
        }
    }    
}
