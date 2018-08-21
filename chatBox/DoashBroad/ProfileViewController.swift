//
//  ProfileViewController.swift
//  MyAppMP3
//
//  Created by Danhloc on 8/6/18.
//  Copyright © 2018 Danhloc. All rights reserved.
//

import UIKit
import  Firebase
import FirebaseAuth
import FirebaseDatabase

class ProfileViewController: UIViewController {
    @IBOutlet weak var imgProfile: UIImageView!
    
    @IBAction func btnLogOut(_ sender: Any) {
        do {
            try Auth.auth().signOut()
        } catch let  SignoutError {
            alert("lỗi", SignoutError.localizedDescription, viewController: self)
        }
        present(LoginViewController(), animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imgProfile.layer.cornerRadius = self.imgProfile.frame.size.width / 2;
        self.imgProfile.clipsToBounds = true;
       
        // self.iniDB()
        // Do any additional setup after loading the view.
    }
    
    
   
}
