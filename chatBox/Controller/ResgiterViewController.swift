//
//  ResgiterViewController.swift
//  chatBox
//
//  Created by Danhloc on 8/20/18.
//  Copyright © 2018 Danhloc. All rights reserved.
//

import UIKit
import  Firebase
import FirebaseAuth
import FirebaseDatabase



class ResgiterViewController: UIViewController,UIImagePickerControllerDelegate,
UINavigationControllerDelegate {
    
       private  let btnclose : UIButton = {
            let button  = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
    
            button.setTitle("Close", for: .normal)
            button.setTitleColor(UIColor(176,224,230), for: .normal)
    
            return button
        }()
      private func layoutClose (){
         view.addSubview(btnclose)
    
       NSLayoutConstraint.activate([
        btnclose.topAnchor.constraint(equalTo: view.topAnchor ,constant : 20),
        btnclose.heightAnchor.constraint(equalToConstant : 40),
         btnclose.widthAnchor.constraint(equalToConstant : 100),
         btnclose.leadingAnchor.constraint(equalTo: view.leadingAnchor , constant : 0)
    
        ])
    
        btnclose.addTarget(self, action: #selector(closeRegister), for: .touchUpInside)
        }
    
        @objc func closeRegister(){
            self.dismiss(animated: true, completion: nil)
    
        }
    
    
    
    
    private let btnkeyboardHeddin : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Heddinkeyboard", for: .normal)
        button.setTitleColor(UIColor(135,206,235), for: .normal)

        return button
    }()

    private func  layoutkeyboardHeddin(){
        view.addSubview(btnkeyboardHeddin)

        NSLayoutConstraint.activate([
            btnkeyboardHeddin.widthAnchor.constraint(equalToConstant : 200),
            btnkeyboardHeddin.heightAnchor.constraint(equalToConstant : 60),
            btnkeyboardHeddin.topAnchor.constraint(equalTo: view.topAnchor , constant: 40),

            btnkeyboardHeddin.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 10)

            ])
        btnkeyboardHeddin.addTarget(self, action: #selector(keyboardtap), for: .touchUpInside)

    }

    @objc func keyboardtap(){
        self.hideKeyboardWhenTappedAround()
    }

     let profileImg : UIImageView = {
        let inmageView : UIImageView = UIImageView(image: #imageLiteral(resourceName: "account"))
        inmageView.translatesAutoresizingMaskIntoConstraints = false
        return inmageView
    }()

    private func layoutProfile() {
        NSLayoutConstraint.activate([
            profileImg.widthAnchor.constraint(equalToConstant : 120),
            profileImg.heightAnchor.constraint(equalToConstant : 120),
            profileImg.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            // profileImg.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant : 20)
            profileImg.topAnchor.constraint(equalTo: view.topAnchor,constant: 100)

            ])
        
        profileImg.addGestureRecognizer(UITapGestureRecognizer(target: self, action:#selector(tapToImgView)))
        profileImg.isUserInteractionEnabled = true

    }




    // this text full name
    private let txtFullName : UITextField  = {
        let textfield = UITextField()

        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.placeholder = "enter your full name "
        textfield.autocorrectionType = .no
        textfield.autocapitalizationType = .none
        return textfield
    }()
    private func layoutTxtfullName(){
        loginRegister.addSubview(txtFullName)

        NSLayoutConstraint.activate([
            txtFullName.heightAnchor.constraint(equalTo: loginRegister.heightAnchor, multiplier: 1/3),
            txtFullName.leadingAnchor.constraint(equalTo: loginRegister.leadingAnchor, constant: 10),
            txtFullName.trailingAnchor.constraint(equalTo: loginRegister.trailingAnchor, constant: -10),

            txtFullName.topAnchor.constraint(equalTo: loginRegister.topAnchor),
            ])
        let lineview = UIView()
        lineview.translatesAutoresizingMaskIntoConstraints = false
        loginRegister.addSubview(lineview)
        lineview.backgroundColor = UIColor(135,206,235)
        NSLayoutConstraint.activate([
            lineview.heightAnchor.constraint(equalToConstant: 1),
            lineview.leadingAnchor.constraint(equalTo: txtFullName.leadingAnchor),
            lineview.trailingAnchor.constraint(equalTo: txtFullName.trailingAnchor),
            lineview.bottomAnchor.constraint(equalTo: txtFullName.bottomAnchor),

            ])
    }



    //this text Email
    private let txtEmail : UITextField  = {
        let textfield = UITextField()

        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.placeholder = "enter email "
        textfield.keyboardType = .emailAddress
        textfield.autocorrectionType = .no
        textfield.autocapitalizationType = .none
        return textfield
    }()

    private func layoutTxtEmail(){
        loginRegister.addSubview(txtEmail)

        NSLayoutConstraint.activate([
            txtEmail.heightAnchor.constraint(equalTo: loginRegister.heightAnchor, multiplier: 1/3),
            txtEmail.leadingAnchor.constraint(equalTo: loginRegister.leadingAnchor, constant: 10),
            txtEmail.trailingAnchor.constraint(equalTo: loginRegister.trailingAnchor, constant: -10),
            txtEmail.topAnchor.constraint(equalTo: txtFullName.bottomAnchor),

            ])
        let lineview = UIView()
        lineview.translatesAutoresizingMaskIntoConstraints = false
        loginRegister.addSubview(lineview)
        lineview.backgroundColor = UIColor(135,206,235)
        NSLayoutConstraint.activate([
            lineview.heightAnchor.constraint(equalToConstant: 1),
            lineview.leadingAnchor.constraint(equalTo: txtEmail.leadingAnchor),
            lineview.trailingAnchor.constraint(equalTo: txtEmail.trailingAnchor),
            lineview.bottomAnchor.constraint(equalTo: txtEmail.bottomAnchor),

            ])
    }

    //this text password
    private let txtPassword : UITextField  = {
        let textfield = UITextField()

        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.placeholder = "enter Password "
        textfield.isSecureTextEntry = true
        textfield.autocorrectionType = .no
        textfield.autocapitalizationType = .none

        return textfield
    }()

    private func layoutTxtPassword(){
        loginRegister.addSubview(txtPassword)

        NSLayoutConstraint.activate([
            txtPassword.heightAnchor.constraint(equalTo: loginRegister.heightAnchor, multiplier: 1/3),
            txtPassword.leadingAnchor.constraint(equalTo: loginRegister.leadingAnchor, constant: 10),
            txtPassword.trailingAnchor.constraint(equalTo: loginRegister.trailingAnchor, constant: -10),
            txtPassword.topAnchor.constraint(equalTo: txtEmail.bottomAnchor),

            ])
        let lineview = UIView()
        lineview.translatesAutoresizingMaskIntoConstraints = false
        loginRegister.addSubview(lineview)
        lineview.backgroundColor = UIColor(135,206,235)
        NSLayoutConstraint.activate([
            lineview.heightAnchor.constraint(equalToConstant: 1),
            lineview.leadingAnchor.constraint(equalTo: txtPassword.leadingAnchor),
            lineview.trailingAnchor.constraint(equalTo: txtPassword.trailingAnchor),
            lineview.bottomAnchor.constraint(equalTo: txtPassword.bottomAnchor),

            ])
    }

    private let btnResgister : UIButton = {

        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("RESGISTER", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        button.setTitleColor(UIColor(70,130,100), for: .normal)
        button.backgroundColor = UIColor(176,224,230)
        button.layer.cornerRadius = 7
        return button
    }()

    private func layoutButtonResgister(){
        view.addSubview(btnResgister)
        NSLayoutConstraint.activate([
            btnResgister.heightAnchor.constraint(equalToConstant: 50),
            btnResgister.leadingAnchor.constraint(equalTo: loginRegister.leadingAnchor),
            btnResgister.trailingAnchor.constraint(equalTo: loginRegister.trailingAnchor),
            btnResgister.topAnchor.constraint(equalTo: txtPassword.bottomAnchor, constant: 15)

            ])
        btnResgister.addTarget(self, action:#selector(hanldeResgister), for:.touchUpInside)
    }


    @objc func hanldeResgister() {
                let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
                let predicate = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
                if predicate.evaluate(with: txtEmail.text) == false{
                    alert("Cảnh báo", "nhập sai email", viewController: self)
                    return
                }
        
                Auth.auth().createUser(withEmail: txtEmail.text ?? "", password: txtPassword.text ?? "")
                    {(user, error) in
                       if error != nil{
                       alert("lỗi", (error?.localizedDescription)!, viewController: self)
                         return
                        }
                        guard let userId = user?.user.uid else {
                        alert("lỗi", "userId bạn rỗng ", viewController: self)
                            return
                    }
                        
                          let randomString = UUID().uuidString
                        
                        let StoragRef = Storage.storage().reference().child("\(randomString).png")
                        
                        if let UploadImg = UIImagePNGRepresentation(self.profileImg.image!)
                        {
                            StoragRef.putData(UploadImg, metadata: nil, completion: { (metadata, error) in
                                if error != nil {
                                    alert("Loi", (error?.localizedDescription)!, viewController: self)
                                    return
                                }

                                StoragRef.downloadURL(completion: { (url, error) in
                                    if error != nil {
                                        alert("loi", (error?.localizedDescription)!, viewController: self)
                                    }
                                    
                                    if let profileImageURL = url?.absoluteString {
                                        print(profileImageURL)
                                        self.registerUser(userId: userId, profileImageURL: profileImageURL)
                                    }
                                    
                                })
                                
                            })
                        }
        
                }

    }

    func registerUser(userId: String, profileImageURL: String?) {
        // alert("thông báo", "đăng kí thành công", viewController: self)
        
        let ref = Database.database().reference()
        
        let UserRef = ref.child("users").child("\(userId)")
        UserRef.updateChildValues([
            
            "fullname" : self.txtFullName.text ?? "",
            "email" : self.txtEmail.text ?? "",
            "password" : self.txtEmail.text ?? "",
            "profileImg" : profileImageURL
            
            ])
        self.dismiss(animated: true, completion: nil)
    }
    
    
    private let loginRegister : UIView  = {
        let view = UIView()

        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false

        return view

    }()

    private func layoutloginResgister(){
        view.addSubview(loginRegister)

        NSLayoutConstraint.activate([
            loginRegister.heightAnchor.constraint(equalToConstant: 140),
            loginRegister.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            loginRegister.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            loginRegister.topAnchor.constraint(equalTo: profileImg.bottomAnchor,constant: 15)
            ])
        loginRegister.layer.cornerRadius  = 7


    }


    override func viewDidLoad() {
        super.viewDidLoad()
        layoutClose()
      //view.backgroundColor = UIColor(176,224,230)
        view.addSubview(profileImg)
        layoutProfile()
        layoutloginResgister()
        layoutTxtfullName()
        layoutTxtEmail()
        layoutTxtPassword()
        layoutkeyboardHeddin()

        layoutButtonResgister()
    }


}
