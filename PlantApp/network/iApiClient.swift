//
//  iApiClient.swift
//  PlantApp
//
//  Created by AcePlus Admin on 11/19/19.
//  Copyright © 2019 TAT. All rights reserved.
//

import Foundation
import RxSwift
protocol iApiClient {
	func getAllPlant() -> Observable<PlantListResponse>
	func getLoginUser(email:String,password:String) -> Observable<UserResponse>
	
}
