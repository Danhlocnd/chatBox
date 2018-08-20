//
//  HomeViewController.swift
//  chatBox
//
//  Created by Danhloc on 8/20/18.
//  Copyright © 2018 Danhloc. All rights reserved.
//

import UIKit
import  Firebase
import FirebaseAuth
import FirebaseDatabase

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      view.backgroundColor = UIColor(12, 37, 45)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Sign Out", style: .plain, target: self, action: #selector(hashablelogOut))
        if Auth.auth().currentUser?.uid == nil{
             self.hashablelogOut()
        }
    }

    @objc func hashablelogOut(){
        do {
            try Auth.auth().signOut()
        } catch let  SignoutError {
            alert("lỗi", SignoutError.localizedDescription, viewController: self)
        }
       present(LoginViewController(), animated: true, completion: nil)
    }
   

}
