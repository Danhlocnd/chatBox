//
//  TabBarViewController.swift
//  MyAppMP3
//
//  Created by Danhloc on 8/7/18.
//  Copyright © 2018 Danhloc. All rights reserved.
//

import UIKit

import  Firebase
import FirebaseAuth
import FirebaseDatabase

class TabBarViewController: UITabBarController {
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    checkLogedInUser()
        // Do any additional setup after loading the view.
    }
    
    fileprivate func checkLogedInUser() {
        //Check user login or not
        print(Auth.auth().currentUser?.uid)
        if Auth.auth().currentUser?.uid == nil {
           // self.hashablelogOut()
            do {
                try Auth.auth().signOut()
            } catch let  SignoutError {
                alert("lỗi", SignoutError.localizedDescription, viewController: self)
            }
       // present(LoginViewController(), animated: true, completion: nil)
        } else {
            //Get detail information from user in Firebase
            let uid = Auth.auth().currentUser?.uid
            Database.database().reference()
                .child("users")
                .child(uid!)
                .observe(.value) { (snapshot) in
                    if let dictUser = snapshot.value as? [String: Any] {
                        //print("dictUser's fullName : \(dictUser["fullName"])")
                        self.navigationItem.title = dictUser["fullName"] as? String
                    }
            }
        }
    }
    
 

}
