//
//  FavouriteViewController.swift
//  PlantApp
//
//  Created by Thuriya ACE Technology on 11/17/19.
//  Copyright © 2019 TAT. All rights reserved.
//

import UIKit

class FavouriteViewController: UIViewController {
    @IBOutlet weak var categoryCollectionView : UICollectionView!
    @IBOutlet weak var favListCollectionView : UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        categoryCollectionView.selectItem(at: IndexPath(row: 0, section: 0), animated: false, scrollPosition: UICollectionView.ScrollPosition.bottom)

    }
    

}

extension FavouriteViewController : UICollectionViewDelegate {
    
}

extension FavouriteViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == categoryCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as? CategoryCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            return cell
        }else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FavouriteItemCollectionViewCell.identifier, for: indexPath) as? FavouriteItemCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            return cell
        }
        
        
    }
    
    
}
