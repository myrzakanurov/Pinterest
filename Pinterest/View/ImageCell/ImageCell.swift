//
//  ImageCell.swift
//  Pinterest
//
//  Created by Arman Myrzakanurov on 05.06.2022.
//

import UIKit
import Kingfisher

protocol ImageCellDelegate: AnyObject {
    func onLikeButtonDidTap(with model: ImageResponceModel, add: Bool)
}

final class ImageCell: UICollectionViewCell {
    
    weak var delegate: ImageCellDelegate?
    
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var likeButton: UIButton!
    
    private var isColored: Bool = false
    private var model: ImageResponceModel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(with model: ImageResponceModel) {
        self.model = model
        if let url = URL(string: model.imageUrl) {
            imageView.kf.setImage(with: url)
        }
    }
    
    @IBAction private func likeDidTap(_ sender: UIButton) {
        isColored.toggle()
        let likeImage = isColored ? "heart.fill" : "heart"
        likeButton.setImage(UIImage(systemName: likeImage), for: .normal)
        delegate?.onLikeButtonDidTap(with: model, add: isColored)
    }
}
