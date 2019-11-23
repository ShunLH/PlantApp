//
//  TipCollectionViewCell.swift
//  PlantApp
//
//  Created by Thuriya ACE Technology on 11/15/19.
//  Copyright © 2019 TAT. All rights reserved.
//

import UIKit

class TipCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var lblTip : UILabel!
    @IBOutlet weak var lblValue : UILabel!
    
	@IBOutlet weak var ivTip: UIImageView!
	static var identifier : String! {
        return String(describing: self)
		
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    
    }
    

}
