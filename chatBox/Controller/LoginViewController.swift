//
//  LoginViewController.swift
//  chatBox
//
//  Created by Danhloc on 8/20/18.
//  Copyright © 2018 Danhloc. All rights reserved.
//

import UIKit
import  Firebase
import FirebaseAuth
import FirebaseDatabase


class LoginViewController: UIViewController {
    
   
    private let btnkeyboardHeddin : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("keyboard", for: .normal)
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
                
//        let tap = UITapGestureRecognizer(target: self, action: #selector(tapToImgView))
//
//                profileImg.addGestureRecognizer(tap)
//
//                profileImg.isUserInteractionEnabled = true
//
//                view.addSubview(profileImg)
               
            }
    
    
   
    // this text full name
//    private let txtFullName : UITextField  = {
//        let textfield = UITextField()
//
//        textfield.translatesAutoresizingMaskIntoConstraints = false
//        textfield.placeholder = "enter your full name "
//        textfield.autocorrectionType = .no
//        textfield.autocapitalizationType = .none
//        return textfield
//    }()
//    private func layoutTxtfullName(){
//        loginRegister.addSubview(txtFullName)
//
//        NSLayoutConstraint.activate([
//            txtFullName.heightAnchor.constraint(equalTo: loginRegister.heightAnchor, multiplier: 1/3),
//            txtFullName.leadingAnchor.constraint(equalTo: loginRegister.leadingAnchor, constant: 10),
//            txtFullName.trailingAnchor.constraint(equalTo: loginRegister.trailingAnchor, constant: -10),
//
//            txtFullName.topAnchor.constraint(equalTo: loginRegister.topAnchor),
//            ])
//        let lineview = UIView()
//        lineview.translatesAutoresizingMaskIntoConstraints = false
//        loginRegister.addSubview(lineview)
//        lineview.backgroundColor = UIColor(135,206,235)
//        NSLayoutConstraint.activate([
//            lineview.heightAnchor.constraint(equalToConstant: 1),
//            lineview.leadingAnchor.constraint(equalTo: txtFullName.leadingAnchor),
//            lineview.trailingAnchor.constraint(equalTo: txtFullName.trailingAnchor),
//            lineview.bottomAnchor.constraint(equalTo: txtFullName.bottomAnchor),
//
//            ])
//    }
    
    
    
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
            txtEmail.heightAnchor.constraint(equalTo: loginRegister.heightAnchor, multiplier: 1/2),
            txtEmail.leadingAnchor.constraint(equalTo: loginRegister.leadingAnchor, constant: 10),
            txtEmail.trailingAnchor.constraint(equalTo: loginRegister.trailingAnchor, constant: -10),
            txtEmail.topAnchor.constraint(equalTo: loginRegister.topAnchor),
            
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
            txtPassword.heightAnchor.constraint(equalTo: loginRegister.heightAnchor, multiplier: 1/2),
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
    //Start button login
    
    private let btnLogin : UIButton = {
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
       button.setTitle("LOGIN", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        button.setTitleColor(UIColor(70,130,100), for: .normal)
        button.backgroundColor = UIColor(176,224,230)
         button.layer.cornerRadius = 7
        return button
    }()
    
    private func layoutButtonLogin(){
       view.addSubview(btnLogin)
        NSLayoutConstraint.activate([
            btnLogin.heightAnchor.constraint(equalToConstant: 50),
            btnLogin.leadingAnchor.constraint(equalTo: loginRegister.leadingAnchor),
             btnLogin.trailingAnchor.constraint(equalTo: loginRegister.trailingAnchor),
            btnLogin.topAnchor.constraint(equalTo: loginRegister.bottomAnchor, constant: 15)
            
            ])
        btnLogin.addTarget(self, action:#selector(hanldeLogin), for:.touchUpInside)
    }
    
    
    @objc func hanldeLogin() {
        guard  let email = txtEmail.text, let password = txtPassword.text  else {
        
            alert("lỗi", "email hoặc password sai", viewController: self)
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if error != nil {
               alert("lỗi", error?.localizedDescription ?? "", viewController: self)
                return
            }
            self.dismiss(animated: true, completion: {
                //performSegue(withIdentifier: "SplashViewController", sender: self.user)
                
            })
        }
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        
        
        
    }
    
    //end button login

    
    //Start button Resgister
    
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
            btnResgister.topAnchor.constraint(equalTo: btnLogin.bottomAnchor, constant: 15)
            
            ])
        btnResgister.addTarget(self, action:#selector(hanldeResgister), for:.touchUpInside)
    }
    
    
    @objc func hanldeResgister() {
       present(ResgiterViewController(), animated: true, completion: nil)
       // navigationController?.pushViewController(ResgiterViewController(), animated: true)
        
    }
    //end button Resgister
    
    
    private let loginRegister : UIView  = {
    let view = UIView()
        
         view.backgroundColor = .white
         view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
        
    }()
    
    private func layoutloginResgister(){
        view.addSubview(loginRegister)
        
        NSLayoutConstraint.activate([
            loginRegister.heightAnchor.constraint(equalToConstant: 90),
            loginRegister.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            loginRegister.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            loginRegister.topAnchor.constraint(equalTo: profileImg.bottomAnchor,constant: 15)
            ])
        loginRegister.layer.cornerRadius  = 7
        
    
    }
    private func dismissKeyboardWhenTouchOutside() {
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapToView)))
        view.isUserInteractionEnabled = true
    }
    @objc func tapToView() {
        //Dismiss keyboard
        view.endEditing(true)
    }
    
    
 
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(profileImg)
        layoutProfile()
        layoutloginResgister()
      //  layoutTxtfullName()
        layoutTxtEmail()
        layoutTxtPassword()
      layoutkeyboardHeddin()
        layoutButtonLogin()
        layoutButtonResgister()
  dismissKeyboardWhenTouchOutside()
       
        
    }

  

}
