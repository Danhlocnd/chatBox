//
//  Extension.swift
//  chatBox
//
//  Created by Danhloc on 8/20/18.
//  Copyright © 2018 Danhloc. All rights reserved.
//

import Foundation
import  UIKit

extension UIColor{

    convenience init(_ red : CGFloat,_ green: CGFloat ,_ blue: CGFloat){
        self.init(red: red/255, green: green/255, blue: blue/255 , alpha: 1)
    }
    
}

func alert(_ title: String,_ mesage : String ,viewController: UIViewController) {
    
    let  alertController = UIAlertController(title: title, message: mesage, preferredStyle: .alert)
    
    let alertCancel = UIAlertAction(title: "Cancel",style: .cancel) { (action) in
        alertController.dismiss(animated: true, completion: nil)
    }
    alertController.addAction(alertCancel)
    
    viewController.present(alertController, animated: true, completion: nil)
    
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
