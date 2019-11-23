//
//  PlantListViewModel.swift
//  PlantApp
//
//  Created by AcePlus Admin on 11/19/19.
//  Copyright © 2019 TAT. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import RealmSwift

class PlantListViewModel: BaseViewModel {
	
	public var plantsObs : PublishSubject<[PlantVO]> = PublishSubject()

	override init() {}
	
	
	public func requestData() {
		apiService.getAllPlant()
			.subscribeOn(ConcurrentDispatchQueueScheduler.init(queue: DispatchQueue.global()))
			.subscribe(onNext: { (response) in
				self.isLoadingObs.accept(false)
				if let data = response.data {
					self.plantsObs.onNext(data)
				}
			}, onError: { (error) in
				self._errorObs.accept(error.localizedDescription)
			}).disposed(by: bag)
	}
	
}
