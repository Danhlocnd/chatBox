//
//  SigninViewController+handlers.swift
//  chatBox
//
//  Created by Danhloc on 8/20/18.
//  Copyright © 2018 Danhloc. All rights reserved.
//

import UIKit

extension LoginViewController {
    
    @objc func tapToImgView(){
        
       
       // picker.allowsEditing = true
        picker.sourceType = .photoLibrary
       picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        present(picker, animated: true, completion: nil)
      
        
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : AnyObject])
    {
//        var selectImg : UIImage?
//
//        if let editImg = info[UIImagePickerControllerOriginalImage] as? UIImage {
//
//            selectImg = editImg
//            print("edit Img ", editImg.size)
//        }else if let orginImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
//
//            selectImg = orginImage
//            print("orginImage Img ", orginImage.size)
//        }
//
//
//
//        profileImg.image = selectImg //4
//        dismiss(animated:true, completion: nil) //5
        if let image = info[UIImagePickerControllerEditedImage] as? UIImage {
            profileImg.image = image
        }
        else if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            profileImg.image = image
        } else{
            print("Something went wrong")
        }

        
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
         dismiss(animated: true, completion: nil)
    }
}
