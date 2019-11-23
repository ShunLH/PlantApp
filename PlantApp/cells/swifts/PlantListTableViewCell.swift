//
//  PlantListTableViewCell.swift
//  PlantApp
//
//  Created by Thuriya ACE Technology on 11/15/19.
//  Copyright © 2019 TAT. All rights reserved.
//

import UIKit
import RealmSwift
import SDWebImage

protocol PlantTableViewCellDelegate {
	func handleFavourite(plant:PlantVO,favourite:Bool)
}
let realm = try! Realm()
class PlantListTableViewCell: UITableViewCell {
    @IBOutlet weak var ivPlant : UIImageView!
    @IBOutlet weak var ivUploadedUser : UIImageView!
    @IBOutlet weak var lblName : UILabel!
    @IBOutlet weak var lblUser : UILabel!
    @IBOutlet weak var btnFavourite : UIButton!
	@IBOutlet weak var plantView: UIView!
	var isFavourite : Bool = false
    static var identifier : String! {
        return String(describing: self)
    }
	var delegate : PlantTableViewCellDelegate?
	var mData : PlantVO? {
		didSet {
			ivPlant.sd_setImage(with: URL(string: mData?.plant_photo ?? ""),placeholderImage:UIImage(named: "default-placeholder"), completed: nil)
			ivUploadedUser.sd_setImage(with: URL(string: mData?.uploaded_user?.user_photo ?? ""),placeholderImage:UIImage(named: "default-placeholder"),completed: nil)
			lblName.text = mData?.plant_name
			lblUser.text = "by \(mData?.uploaded_user?.name ?? "")"
			if let _ = realm.object(ofType: FavouritePlant.self, forPrimaryKey: mData?.plant_id ?? "") {
				isFavourite = true
			}else {
				isFavourite = false
			}
			btnFavourite.imageView?.image = isFavourite ? UIImage(named: "favourite") : UIImage(named: "like")
			
		}
	}
    override func awakeFromNib() {
        super.awakeFromNib()
        plantView.clipsToBounds = true
        plantView.layer.cornerRadius = 20
        plantView.layer.maskedCorners = [.layerMinXMaxYCorner]
        ivUploadedUser.layer.cornerRadius = 20
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    
    @IBAction func btnFavourite(_ sender: Any) {
		isFavourite = !isFavourite
	
		if let plant = mData{
			delegate?.handleFavourite(plant: plant, favourite: isFavourite)
			btnFavourite.setImage(isFavourite ? UIImage(named: "favourite"):UIImage(named: "like"), for: .normal)
			
		}
    }
}
