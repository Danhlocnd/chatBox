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
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(handleNewMessage))
        navigationItem.leftBarButtonItem?.tintColor = UIColor(70, 130, 180)
        navigationItem.rightBarButtonItem?.tintColor = UIColor(70, 130, 180)
           checkLogedInUser()
    }

    @objc func handleNewMessage() {
        let newMessageVC = NewMessageViewController()
        let navigationVC = UINavigationController(rootViewController: newMessageVC)
        present(navigationVC, animated: true, completion: nil)
    }
    
    fileprivate func checkLogedInUser() {
        //Check user login or not
        if Auth.auth().currentUser?.uid == nil {
            self.hashablelogOut()
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
    
    @objc func hashablelogOut(){
        do {
            try Auth.auth().signOut()
        } catch let  SignoutError {
            alert("lỗi", SignoutError.localizedDescription, viewController: self)
        }
       present(LoginViewController(), animated: true, completion: nil)
    }
   

}
