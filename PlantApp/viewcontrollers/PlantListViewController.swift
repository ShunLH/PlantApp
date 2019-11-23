//
//  ViewController.swift
//  PlantApp
//
//  Created by Thuriya ACE Technology on 11/15/19.
//  Copyright © 2019 TAT. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RealmSwift
import LGSideMenuController

class PlantListViewController: UIViewController {
	
	@IBOutlet weak var ivHeader: UIImageView!
	@IBOutlet weak var tableViewPlantList : UITableView!
	let viewModel = PlantListViewModel()
	let bag = DisposeBag()
//	let realm = try! Realm()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		ivHeader.layer.cornerRadius = 10
		tableViewPlantList.register(UINib(nibName: PlantListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: PlantListTableViewCell.identifier)
		
		viewModel.plantsObs.observeOn(MainScheduler.instance)
			.bind(to: tableViewPlantList.rx.items) { tableView, index , item in
				let cell = tableView.dequeueReusableCell(withIdentifier: PlantListTableViewCell.identifier, for: IndexPath(row:index,section: 0)) as! PlantListTableViewCell
				cell.delegate = self
				cell.mData = item
				return cell
				
		}.disposed(by: bag)
		
		tableViewPlantList.rx.modelSelected(PlantVO.self)
			.subscribe(onNext: { plant in
				let vc = Router.getPlantDetailViewController()
				vc.mPlant = plant
				if let _ = realm.object(ofType: FavouritePlant.self, forPrimaryKey: plant.plant_id ?? "") {
					vc.isFavourite = true
				}else {
					vc.isFavourite = false
				}
				self.present(vc, animated: true, completion: nil)
				
			}).disposed(by: bag)
		
		viewModel.requestData()
	}
	
	@IBAction func onClickMenu(_ sender: Any) {
		if let vc = sideMenuController?.rootViewController {
			vc.showLeftViewAnimated(self)

		}
	}
	
}
extension PlantListViewController : PlantTableViewCellDelegate {
	func handleFavourite(plant: PlantVO, favourite: Bool) {
		if favourite {
			FavouritePlant.addToFavourite(plantVO: plant,realm: try!Realm())
		}else {
			FavouritePlant.removeFromFavourite(plantID: plant.plant_id ?? "", realm: try! Realm())
		}
	}

	
}
