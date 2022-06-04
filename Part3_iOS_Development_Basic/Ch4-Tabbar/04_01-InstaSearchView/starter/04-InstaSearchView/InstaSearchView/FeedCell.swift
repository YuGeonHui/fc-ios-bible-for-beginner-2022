//
//  FeedCell.swift
//  InstaSearchView
//
//  Created by geonhui Yu on 2022/06/04.
//

import UIKit

class FeedCell: UICollectionViewCell {
    
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        thumbnailImageView.image = nil
    }
    
    func configure(_ imageName: String) {
        thumbnailImageView.image = UIImage(named: imageName)
    }
}
