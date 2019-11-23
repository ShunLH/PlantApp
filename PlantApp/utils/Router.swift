//
//  Router.swift
//  PlantApp
//
//  Created by AcePlus Admin on 11/20/19.
//  Copyright © 2019 TAT. All rights reserved.
//

import Foundation
import UIKit

class Router{
	
	static func getPlantDetailViewController() -> PlantDetailViewController {
		let sb = UIStoryboard(name: SB_HOME, bundle: nil)
		let viewcontroller = sb.instantiateViewController(withIdentifier: PlantDetailViewController.identifier) as! PlantDetailViewController
		return viewcontroller
	}
}
