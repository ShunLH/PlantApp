//
//  LeftViewController.swift
//  PlantApp
//
//  Created by AcePlus Admin on 11/22/19.
//  Copyright © 2019 TAT. All rights reserved.
//

import UIKit

class LeftViewController: UIViewController {
	
	@IBOutlet weak var menuListTableView : UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
		

    }

}
extension LeftViewController : UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
		cell.textLabel?.text = "Favourites"
		return cell
	}
	
	
}
extension LeftViewController : UITableViewDelegate {
	
}

