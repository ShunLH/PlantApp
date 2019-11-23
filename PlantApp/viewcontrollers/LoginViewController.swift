//
//  LoginViewController.swift
//  PlantApp
//
//  Created by Thuriya ACE Technology on 11/15/19.
//  Copyright © 2019 TAT. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxGesture


class LoginViewController: UIViewController {
	
	@IBOutlet weak var tfPassword: UITextField!
	@IBOutlet weak var tfEmail: UITextField!
	@IBOutlet weak var lblEmailValid : UILabel!
	@IBOutlet weak var lblPasswordValid : UILabel!
	
	@IBOutlet weak var btnForgotPwd: UIButton!
	@IBOutlet weak var loginTapView: RoundCornerView!
	let viewModel = LoginViewModel()
	let bag = DisposeBag()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		lblEmailValid.text = "Eamil is required!"
		lblPasswordValid.text = "Password is required!"
		initObserver()
		
		lblEmailValid.isHidden = true
		lblPasswordValid.isHidden = true
		
	}
	
	fileprivate func initObserver(){
		viewModel.dataObs.observeOn(MainScheduler.instance)
			.subscribe(onNext: { (data) in
				print("user \(data)")
				UserDefaults.standard.set(data.user_id, forKey: USER_ID)

//				self.performSegue(withIdentifier: SB_HOME_SEGUE_ID, sender: self)
			}, onError: { (error) in
				self.showAlert(title: "Error", message: error.localizedDescription)
			},onCompleted: {
				UserDefaults.standard.set(true, forKey: IS_LOGIN)
				self.performSegue(withIdentifier: SB_HOME_SEGUE_ID, sender: self)
				
				
			}).disposed(by: bag)
		loginTapView.rx.tapGesture().when(.recognized).subscribe(onNext: { (gesture) in
			if self.Validtion(){
				self.viewModel.requestUser(email: self.tfEmail.text ?? "", password: self.tfPassword.text ?? "")
			}else {
				print("invalid")
			}
			
		}).disposed(by:bag)
	}
	
	func Validtion() -> Bool{
		var result : Bool = false
		let emailValid = tfEmail.rx.text.orEmpty
			.map { $0.count != 0}
			.share(replay: 1)
		
		let passwordValid = tfPassword.rx.text.orEmpty
			.map { $0.count != 0}
			.share(replay: 1)
		
		let everythingValid = Observable.combineLatest(emailValid, passwordValid) { $0 && $1 }
			.share(replay: 1)
		emailValid
			.bind(to: lblEmailValid.rx.isHidden)
			.disposed(by: bag)
		
		passwordValid
			.bind(to: lblPasswordValid.rx.isHidden)
			.disposed(by: bag)
		
		everythingValid.subscribe(onNext: { (value) in
			result = value
		}).disposed(by: bag)
		return result
	}
	
	
}
