//
//  SigninViewController+handlers.swift
//  chatBox
//
//  Created by Danhloc on 8/20/18.
//  Copyright © 2018 Danhloc. All rights reserved.
//

import UIKit

extension ResgiterViewController {
    
    @objc func tapToImgView(){
         let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
      
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        var selectedImage: UIImage?
        if let editedImage = info[UIImagePickerControllerEditedImage] as? UIImage {
            //How to edit image ?
            selectedImage = editedImage
            print("editedImage's size = \(editedImage.size)")
        } else if let originImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            selectedImage = originImage
            print("originImage's size = \(originImage.size)")
        }
        profileImg.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
