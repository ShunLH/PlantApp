//
//  PlantDetailViewController.swift
//  PlantApp
//
//  Created by Thuriya ACE Technology on 11/15/19.
//  Copyright © 2019 TAT. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import SDWebImage
import RealmSwift
class PlantDetailViewController: UIViewController {
    
    static var identifier : String! {
        return String(describing: self)
    }
    
    @IBOutlet weak var lblPlantName: UILabel!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var btnFavourite: UIButton!
    @IBOutlet weak var ivPlant: UIImageView!

    @IBOutlet weak var ivUserProfile: UIImageView!
    @IBOutlet weak var tipsCollectionView : UICollectionView!
	var mPlant : PlantVO? = nil
	var tips : TipVO? = nil
	var isFavourite : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ivUserProfile.layer.cornerRadius = 20
        tipsCollectionView.register(UINib(nibName: TipCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: TipCollectionViewCell.identifier)
        tipsCollectionView.delegate = self
        tipsCollectionView.dataSource = self
		initView()
		
        
    }
	private func initView(){
		lblPlantName.text = mPlant?.plant_name ?? "dummy_name"
		lblUserName.text = mPlant?.uploaded_user?.name ?? "dummy_user"
		lblDescription.text = mPlant?.description ?? "dummy_desc"
		ivPlant.sd_setImage(with: URL(string: mPlant?.plant_photo ?? ""),placeholderImage: UIImage(named: "default-placeholder"), completed: nil)
		ivUserProfile.sd_setImage(with: URL(string: mPlant?.uploaded_user?.user_photo ?? ""),placeholderImage: UIImage(named: "default-placeholder"), completed: nil)
		if isFavourite {
			btnFavourite.setImage(#imageLiteral(resourceName: "favourite"), for: .normal)
		}else {
			btnFavourite.setImage(#imageLiteral(resourceName: "like"), for: .normal)
		}
		if let t = mPlant?.tips {
			tips = t
		}
	}
	
	@IBAction func btnFavourite(_ sender: Any) {
		isFavourite = !isFavourite
		btnFavourite.setImage(isFavourite ? UIImage(named: "favourite"):UIImage(named: "like"), for: .normal)
		
		if let plant = mPlant{
			if isFavourite {
				FavouritePlant.addToFavourite(plantVO: plant, realm: try! Realm())
			}else {
				FavouritePlant.removeFromFavourite(plantID: plant.plant_id ?? "", realm: try! Realm())
			}
			
		}
    }

	
}

extension PlantDetailViewController : UICollectionViewDelegate {
    
}
extension PlantDetailViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (self.view.frame.width-30)/2, height: 180)
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
		switch indexPath.row {
		case 0:
			cell.lblTip.text = "Temperature"
			cell.lblValue.text = tips?.temperature
			cell.ivTip.image = #imageLiteral(resourceName: "icons8-warm-50")
		case 1:
			cell.lblTip.text = "Light"
			cell.lblValue.text = tips?.light
			cell.ivTip.image = #imageLiteral(resourceName: "icons8-sun-48")
		case 2:
			cell.lblTip.text = "Placement"
			cell.lblValue.text = tips?.placement
			cell.ivTip.image = #imageLiteral(resourceName: "icons8-potted-plant-50")
		default:
			cell.lblValue.text = ""
		}
        return cell
    }
    
    
}
