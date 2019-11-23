//
//  ViewController.swift
//  PlantApp
//
//  Created by Thuriya ACE Technology on 11/15/19.
//  Copyright © 2019 TAT. All rights reserved.
//

import UIKit

class PlantListViewController: UIViewController {

    @IBOutlet weak var ivHeader: UIImageView!
    @IBOutlet weak var tableViewPlantList : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ivHeader.layer.cornerRadius = 10
        tableViewPlantList.register(UINib(nibName: PlantListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: PlantListTableViewCell.identifier)
        tableViewPlantList.dataSource = self
        tableViewPlantList.delegate = self
        
        
    }

}

extension PlantListViewController : UITableViewDataSource , UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PlantListTableViewCell.identifier, for: indexPath) as? PlantListTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: SB_PLANT_DETAILS_SEGUE_ID, sender: self)
    }
    
    
}
