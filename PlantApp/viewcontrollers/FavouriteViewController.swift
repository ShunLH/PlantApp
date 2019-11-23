//
//  FavouriteViewController.swift
//  PlantApp
//
//  Created by Thuriya ACE Technology on 11/17/19.
//  Copyright © 2019 TAT. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RealmSwift

class FavouriteViewController: UIViewController {
	@IBOutlet weak var categoryCollectionView : UICollectionView!
	@IBOutlet weak var favListCollectionView : UICollectionView!
    var notificationToken: NotificationToken? = nil

	let viewModel = FavouriteViewModel()
	let bag = DisposeBag()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		categoryCollectionView.delegate = self
		favListCollectionView.delegate = self
		favListCollectionView.dataSource = self
		registerNotificationToken()
		viewModel.fetchFavouritePlants()
		
		viewModel.categoryObs.bind(to: categoryCollectionView.rx.items(cellIdentifier: CategoryCollectionViewCell.identifier, cellType: CategoryCollectionViewCell.self)) { row,element,cell in
			cell.lblName.text = element
			
		}.disposed(by: bag)
		categoryCollectionView.selectItem(at: IndexPath(row: 0, section: 0), animated: false, scrollPosition: UICollectionView.ScrollPosition.bottom)

	}
	fileprivate func registerNotificationToken(){
		// Observe Results Notifications
		notificationToken = viewModel.favPlantList?.observe { [weak self] (changes: RealmCollectionChange) in
            guard let collectionView = self?.favListCollectionView else { return }
            switch changes {
            case .initial:
                collectionView.reloadData()
            case .update(_, let deletions, let insertions, let modifications):
				collectionView.performBatchUpdates({
					collectionView.deleteItems(at: deletions.map({ IndexPath(row: $0, section: 0)}))
					collectionView.insertItems(at: insertions.map({ IndexPath(row: $0, section: 0) }))
					collectionView.reloadItems(at: modifications.map({ IndexPath(row: $0, section: 0)}))
				}, completion: nil)
               
            case .error(let error):
                fatalError("\(error)")
            }
        }
	}
	deinit {
        notificationToken?.invalidate()
    }
	
}

extension FavouriteViewController : UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		if collectionView ==  favListCollectionView {
			let w : CGFloat = (self.view.frame.width - 48)/2
			return CGSize(width:w,height: w)
		}else {
			return CGSize(width:70,height : 40)
		}
		
	}
	
}

extension FavouriteViewController : UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return viewModel.favPlantList?.count ?? 0
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FavouriteItemCollectionViewCell.identifier, for: indexPath) as? FavouriteItemCollectionViewCell else {
			return UICollectionViewCell()
		}
		cell.mData = viewModel.favPlantList?[indexPath.row].plantPhoto
		return cell
		
	}
	
	
}
