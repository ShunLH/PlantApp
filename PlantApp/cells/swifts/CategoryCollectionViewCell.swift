//
//  CategoryCollectionViewCell.swift
//  PlantApp
//
//  Created by Thuriya ACE Technology on 11/17/19.
//  Copyright © 2019 TAT. All rights reserved.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var backView : UIView!
    @IBOutlet weak var lblName : UILabel!
    static var identifier : String! {
        return String(describing: self)
    }
    
    override func awakeFromNib() {
        backView.layer.cornerRadius = 20
        
    }
    override var isSelected: Bool {
        didSet{
            if isSelected {
            backView.backgroundColor = #colorLiteral(red: 0.2745098039, green: 0.568627451, blue: 0.2235294118, alpha: 1)
                lblName.textColor = UIColor(named: "WhiteColor")
            }else {
                backView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                lblName.textColor = UIColor(named: "GreyColor")
            }
        }
    }

}
