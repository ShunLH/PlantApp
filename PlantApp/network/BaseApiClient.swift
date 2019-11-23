//
//  BaseApiClient.swift
//  PlantApp
//
//  Created by AcePlus Admin on 11/19/19.
//  Copyright © 2019 TAT. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift
import RxCocoa


class BaseApiClient {
	
	func requestApiWithoutHeader<T>(
			url: String,
			method : HTTPMethod,
			params : Parameters,
			value : T.Type
		)-> Observable<T> where T : Codable {
		return Observable<T>.create { (observer) -> Disposable in
			let request = Alamofire.request(ROUTES.BASE_URL + url, method: method, parameters: params, headers: [:])
			request.responseJSON { (response) in
				switch response.result {
					
				case .success(_):
					if 200...299 ~= response.response?.statusCode ?? 500 {
						let data = try! JSONDecoder().decode(T.self, from: response.data!)
						observer.onNext(data)
						observer.onCompleted()
					}else {
						let error = try? JSONDecoder().decode(ErrorResponse.self, from: response.data!)
						print("error \(error?.error?.message ?? "")")
						observer.onCompleted()
					}
				case .failure(let error):
					observer.onError(error)
				}
			}
			return Disposables.create(with: {
				request.cancel()
			})
		}
	}
	
}
