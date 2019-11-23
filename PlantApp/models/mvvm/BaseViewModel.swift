//
//  BaseViewModel.swift
//  PlantApp
//
//  Created by AcePlus Admin on 11/19/19.
//  Copyright © 2019 TAT. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class BaseViewModel {
	public var isLoadingObs : BehaviorRelay<Bool> = BehaviorRelay(value: false)
	public var _errorObs : BehaviorRelay<String?> = BehaviorRelay(value: nil)
	let apiService = SharedApiClient.shared
	let bag = DisposeBag()


}
