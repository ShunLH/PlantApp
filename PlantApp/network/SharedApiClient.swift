//
//  ShareApiClient.swift
//  PlantApp
//
//  Created by AcePlus Admin on 11/19/19.
//  Copyright © 2019 TAT. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift

class SharedApiClient: BaseApiClient {
	static var shared = SharedApiClient()
	private override init() {}
	
}
extension SharedApiClient : iApiClient {
	func getLoginUser(email:String,password:String) -> Observable<UserResponse> {
		let parameters :Parameters = ["email":email,"password":password]
		return requestApiWithoutHeader(url: ROUTES.LOGIN, method: .post, params: parameters, value: UserResponse.self)
		
	}
	
	func getAllPlant() -> Observable<PlantListResponse> {
		return requestApiWithoutHeader(url: ROUTES.GET_ALL_PLANTS, method: .post, params: [:], value: PlantListResponse.self)
	
	}
	
	
}
