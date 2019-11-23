//
//  LoginViewModel.swift
//  PlantApp
//
//  Created by AcePlus Admin on 11/19/19.
//  Copyright © 2019 TAT. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

class LoginViewModel: BaseViewModel {
	
	public var dataObs : PublishSubject<LoginUserVO> = PublishSubject()
	
	override init() {}
	
	func requestUser(email:String,password:String) {
		apiService.getLoginUser(email: email, password: password)
			.subscribeOn(ConcurrentDispatchQueueScheduler.init(queue: DispatchQueue.global()))
			.subscribe(onNext: { (response) in
				self.isLoadingObs.accept(false)
				if let data = response.data {
					self.dataObs.onNext(data)
				}
			}, onError: {
				error in
				self._errorObs.accept(error.localizedDescription)
			},onCompleted: {
				self.dataObs.onCompleted()
			}).disposed(by: bag)
	}
	
}
