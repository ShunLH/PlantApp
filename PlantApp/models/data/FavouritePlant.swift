//
//  FavouritePlant.swift
//  PlantApp
//
//  Created by AcePlus Admin on 11/22/19.
//  Copyright © 2019 TAT. All rights reserved.
//

import Foundation
import RealmSwift

class FavouritePlant : Object {

	@objc dynamic var userId : String = ""
	@objc dynamic var userName : String = ""
	@objc dynamic var plantID : String = ""
    @objc dynamic var plantName : String = ""
    @objc dynamic var plantPhoto : String = ""
	
	override class func primaryKey() -> String? {
		return "plantID"
	}
	
	static func removeFromFavourite(plantID : String,realm:Realm) {
		guard let plant = realm.object(ofType: FavouritePlant.self, forPrimaryKey: plantID) else {return}
		do {
			try realm.write {
				realm.delete(plant)
			}
		}catch {
			print("Faild to remove favourite plant\(error) ")
		}
	}
	static func addToFavourite(plantVO : PlantVO,realm:Realm) {
		let favPlant = FavouritePlant()
		favPlant.plantID = plantVO.plant_id ?? ""
		favPlant.plantName = plantVO.plant_name ?? ""
		favPlant.plantPhoto = plantVO.plant_photo ?? ""
		if let userID = UserDefaults.standard.string(forKey: USER_ID) {
			favPlant.userId = userID
		}
		do {
			try realm.write {
				realm.add(favPlant,update: .modified)
				
			}
		}catch {
			print("Failed to save favourite plant \(error)")
		}
	}
}

