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
    @IBOutlet private weak var carProsTitleLabel: UILabel!
    @IBOutlet private weak var carProsLabel: UILabel!
    @IBOutlet private weak var carConsTitleLabel: UILabel!
    @IBOutlet private weak var carConsLabel: UILabel!
    @IBOutlet private var carRatingCollection: [UIImageView]!
    
    let separator = CALayer()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        // Reset any cell content here
        carProsTitleLabel.text = nil
        carProsLabel.text = nil
        carConsTitleLabel.text = nil
        carConsLabel.text = nil
        
        for image in carRatingCollection {
            image.image = nil
        }
    }
    
    func configure(with car: CarModel) {
        carImage.image = UIImage(named: car.make)
        carModelLabel.text = car.make
        carPriceLabel.text = car.customerPriceString
        
        for i in 0 ..< car.rating {
            let image = UIImage(systemName: "star.fill")
            carRatingCollection[i].image = image
        }
        
        if !car.prosList.isEmpty {
            carProsTitleLabel.text = "Pros:"
            carProsLabel.attributedText = bulletSeparaterText(list: car.prosList)
        }
        
        if !car.consList.isEmpty {
            carConsTitleLabel.text = "Cons:"
            carConsLabel.attributedText = bulletSeparaterText(list: car.consList)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let separatorHeight: CGFloat = 4.0
        let separatorColor = UIColor.orange.cgColor
        
        self.separator.backgroundColor = separatorColor
        self.separator.frame = CGRect(x: self.contentView.bounds.origin.x + 15,
                                      y: self.contentView.bounds.height - separatorHeight,
                                      width: self.contentView.bounds.width - 30,
                                      height: separatorHeight)
        self.contentView.layer.addSublayer(self.separator)
        
    }
    
    private func bulletSeparaterText(list: [String]) -> NSMutableAttributedString {
        let bullet = "\u{25CF}   "
        let bulletFont = UIFont.systemFont(ofSize: UIFont.systemFontSize * 0.7)
        let bulletAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: Theme.Colors.orangeColor,
            .font: bulletFont
        ]
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 10
        
        let textAttributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.black, .paragraphStyle: paragraphStyle]
        let combinedArray = list.filter { !$0.isEmpty }
        let changedText = NSMutableAttributedString()
        
        if !combinedArray.isEmpty {
            for i in combinedArray {
                let attributedText = NSMutableAttributedString(string: "\(bullet)\(i)\n", attributes: textAttributes)
                attributedText.addAttributes(bulletAttributes, range: NSRange(location: 0, length: bullet.count))
                changedText.append(attributedText)
            }
            let lastCharacterRange = NSRange(location: changedText.length - 1, length: 1)
            changedText.deleteCharacters(in: lastCharacterRange)
        }
        return changedText
    }
}
