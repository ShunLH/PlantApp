//
//  LoginUserVO.swift
//  PlantApp
//
//  Created by AcePlus Admin on 11/19/19.
//  Copyright © 2019 TAT. All rights reserved.
//

import Foundation

struct LoginUserVO : Codable {
	let user_id : String?
	let user_name : String?
	let user_photo_url : String?
	let member_since : String?
	let member_rank : String?
}
