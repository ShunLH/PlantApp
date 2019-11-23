//
//  PlantListTableViewCell.swift
//  PlantApp
//
//  Created by Thuriya ACE Technology on 11/15/19.
//  Copyright © 2019 TAT. All rights reserved.
//

import UIKit

class PlantListTableViewCell: UITableViewCell {
    @IBOutlet weak var ivPlant : UIImageView!
    @IBOutlet weak var ivUploadedUser : UIImageView!
    @IBOutlet weak var lblName : UILabel!
    @IBOutlet weak var lblUser : UILabel!
    @IBOutlet weak var btnFavourite : UIButton!
    
    static var identifier : String! {
        return String(describing: self)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        ivUploadedUser.layer.cornerRadius = 20
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    
    @IBAction func btnFavourite(_ sender: Any) {
        
    }
}
