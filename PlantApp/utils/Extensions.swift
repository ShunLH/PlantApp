//
//  Extensions.swift
//  PlantApp
//
//  Created by Thuriya ACE Technology on 11/18/19.
//  Copyright © 2019 TAT. All rights reserved.
//

import Foundation

import UIKit

extension UIViewController {
	
	func showAlert(title:String,message:String){
		let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
		let action = UIAlertAction(title: "OK", style: .default, handler: nil)
		alert.addAction(action)
		self.present(alert, animated: true, completion: nil)
	}
    
}
