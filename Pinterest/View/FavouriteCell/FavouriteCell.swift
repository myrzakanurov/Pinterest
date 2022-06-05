//
//  FavouriteCell.swift
//  Pinterest
//
//  Created by Arman Myrzakanurov on 05.06.2022.
//

import UIKit
import Kingfisher

final class FavouriteCell: UICollectionViewCell {
    
    @IBOutlet private weak var imageView: UIImageView!
    
    func configure(with imageUrl: String) {
        guard let url = URL(string: imageUrl) else { return }
        imageView.kf.setImage(with: url)
    }
    
}
