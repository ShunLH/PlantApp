//
//  PlantListResponse.swift
//  PlantApp
//
//  Created by AcePlus Admin on 11/19/19.
//  Copyright © 2019 TAT. All rights reserved.
//

import Foundation

struct PlantListResponse : Codable {
	let code : Int?
	let message : String?
	let data : [PlantVO]?
	
}
