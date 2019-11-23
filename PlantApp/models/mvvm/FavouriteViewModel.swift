//
//  FavouriteViewModel.swift
//  PlantApp
//
//  Created by AcePlus Admin on 11/22/19.
//  Copyright © 2019 TAT. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift
import RealmSwift

class FavouriteViewModel: BaseViewModel {
	
	let categoryObs = Observable<[String]>.just(["Recent","Old","Color","Album"])
	var favPlantList : Results<FavouritePlant>?
	
	override init() {}
	
	public func fetchFavouritePlants() {
		let realm = try! Realm()
		favPlantList = realm.objects(FavouritePlant.self)

	}
	

}
