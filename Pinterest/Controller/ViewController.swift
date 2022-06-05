//
//  ViewController.swift
//  Pinterest
//
//  Created by Arman Myrzakanurov on 05.06.2022.
//

import UIKit

final class ViewController: UIViewController {
    
    var manager = PinterestManager()
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    private var imageModels: [ImageResponceModel] = []
    private var imageDict: [String: String] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager.delegate = self
        setupCollectionView()
        manager.fetchImages()
    }
}

// MARK: - PinterestManagerDelegate

extension ViewController: PinterestManagerDelegate {
    
    func onImageModelsDidUpdate(with models: [ImageResponceModel]) {
        imageModels = models
        collectionView.reloadData()
    }
}

// MARK: - ImageCellDelegate

extension ViewController: ImageCellDelegate {
    
    func onLikeButtonDidTap(with model: ImageResponceModel, add: Bool) {
        if add {
            imageDict[model.id] = model.imageUrl
        } else {
            imageDict.removeValue(forKey: model.id)
        }
        UserDefaults.standard.set(imageDict, forKey: "imageDict")
    }
}

// MARK: - UICollectionViewDataSource

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as! ImageCell
        cell.configure(with: imageModels[indexPath.row])
        cell.delegate = self
        return cell
    }
}

// MARK: - Private

private extension ViewController {
    
    func setupCollectionView() {
        collectionView.dataSource = self
        let nib = UINib(nibName: "ImageCell", bundle: Bundle.main)
        collectionView.register(nib, forCellWithReuseIdentifier: "ImageCell")
    }
}
