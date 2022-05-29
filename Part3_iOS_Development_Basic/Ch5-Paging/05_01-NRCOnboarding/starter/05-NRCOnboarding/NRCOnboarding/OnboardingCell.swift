//
//  OnboardingCell.swift
//  NRCOnboarding
//
//  Created by geonhui Yu on 2022/05/29.
//

import UIKit

class OnboardingCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    func configure(_ message: OnboardingMessage) {
        
        thumbnailImageView.image = UIImage(named: message.imageName)
        titleLabel.text = message.title
        descLabel.text = message.description
    }
}
