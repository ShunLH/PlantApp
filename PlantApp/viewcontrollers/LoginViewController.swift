//
//  LoginViewController.swift
//  PlantApp
//
//  Created by Thuriya ACE Technology on 11/15/19.
//  Copyright © 2019 TAT. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    
    @IBOutlet weak var btnForgotPwd: UIButton!
    @IBOutlet weak var loginTapView: RoundCornerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleLogin))
        loginTapView.addGestureRecognizer(tapGesture)

    }
    
    @objc func handleLogin() {
        self.performSegue(withIdentifier: SB_HOME_SEGUE_ID, sender: self)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
