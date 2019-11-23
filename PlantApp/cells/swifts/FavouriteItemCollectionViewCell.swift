//
//  FavouriteItemCollectionViewCell.swift
//  PlantApp
//
//  Created by Thuriya ACE Technology on 11/17/19.
//  Copyright © 2019 TAT. All rights reserved.
//

import UIKit
import SDWebImage

class FavouriteItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var ivPlant : UIImageView!
    
    var mData : String? {
        didSet {
            ivPlant.sd_setImage(with: URL(string: mData ?? ""),placeholderImage: UIImage(named: "background"), completed: nil)
        }
    }
    
    static var identifier : String! {
        return String(describing: self)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
}
