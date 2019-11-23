//
//  PlantDetailViewController.swift
//  PlantApp
//
//  Created by Thuriya ACE Technology on 11/15/19.
//  Copyright © 2019 TAT. All rights reserved.
//

import UIKit

class PlantDetailViewController: UIViewController {
    
    static var identifier : String! {
        return String(describing: self)
    }
    
    @IBOutlet weak var lblPlantName: UILabel!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var btnFavourite: UIButton!
    
    @IBOutlet weak var ivUserProfile: UIImageView!
    @IBOutlet weak var tipsCollectionView : UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ivUserProfile.layer.cornerRadius = 20
        tipsCollectionView.register(UINib(nibName: TipCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: TipCollectionViewCell.identifier)
        tipsCollectionView.delegate = self
        tipsCollectionView.dataSource = self
        
    }
    

}
extension PlantDetailViewController : UICollectionViewDelegate {
    
    
}
extension PlantDetailViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 140, height: 150)
    }
}
extension PlantDetailViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TipCollectionViewCell.identifier, for: indexPath) as? TipCollectionViewCell else {
            return UICollectionViewCell()
        }
        return cell
    }
    
    
}
