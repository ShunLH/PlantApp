//
//  UserResponse.swift
//  PlantApp
//
//  Created by AcePlus Admin on 11/19/19.
//  Copyright © 2019 TAT. All rights reserved.
//

import Foundation
struct UserResponse : Codable {
	let code : Int?
	let message : String?
	let data : LoginUserVO?
	
}
