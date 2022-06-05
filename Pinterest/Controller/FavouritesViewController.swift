//
//  FavouritesViewController.swift
//  Pinterest
//
//  Created by Arman Myrzakanurov on 05.06.2022.
//

import UIKit

final class FavouritesViewController: UIViewController {
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    private var images: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        getImages()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getImages()
    }
}

// MARK: - UICollectionViewDataSource

extension FavouritesViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavouriteCell", for: indexPath) as! FavouriteCell
        let imageUrl = images[indexPath.row]
        cell.configure(with: imageUrl)
        return cell
    }
}

// MARK: - Private

private extension FavouritesViewController {
    
    func getImages() {
        if let images = UserDefaults.standard.object(forKey: "imageDict") as? [String: String] {
            self.images = Array(images.values)
            collectionView.reloadData()
        }
    }
    
    func setupCollectionView() {
        collectionView.dataSource = self
        let nib = UINib(nibName: "FavouriteCell", bundle: Bundle.main)
        collectionView.register(nib, forCellWithReuseIdentifier: "FavouriteCell")
    }
}
