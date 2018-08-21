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
    
    @IBOutlet weak var txtfullname: UILabel!
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
    
//    override func viewDidAppear(_ animated: Bool) {
//      print("123")
//    }
//    override func viewWillDisappear(_ animated: Bool) {
//           print("456")
//    }
    
    override func viewWillAppear(_ animated: Bool) {
          checkLogedInUser()
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
                        self.txtfullname.text = dictUser["fullname"] as? String
                        
                        self.imgProfile.image = UIImage.gif(url: dictUser["profileImg"] as! String)

                    }
            }
        }
    }
   
}
