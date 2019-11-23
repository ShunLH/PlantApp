//
//  ErrorResponse.swift
//  PlantApp
//
//  Created by AcePlus Admin on 11/19/19.
//  Copyright © 2019 TAT. All rights reserved.
//

import Foundation
struct Err : Codable {
	let name : String?
	let message : String?	
}
struct ErrorResponse : Codable {
	let error : Err?
}
