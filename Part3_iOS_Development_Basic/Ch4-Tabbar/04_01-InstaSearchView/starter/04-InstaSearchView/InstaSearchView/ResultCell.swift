//
//  ResultCell.swift
//  InstaSearchView
//
//  Created by geonhui Yu on 2022/06/01.
//

import UIKit

class ResultCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    // MARK: 재사용되기 전에 준비한다.
    override func prepareForReuse() {
        super.prepareForReuse()
        
        thumbnailImageView.image = nil
    }
    
    func configure(_ imageName: String) {
        
        thumbnailImageView.image = UIImage(named: imageName)
    }
}
