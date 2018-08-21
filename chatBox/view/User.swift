//
//  User.swift
//  chatBox
//
//  Created by Danhloc on 8/21/18.
//  Copyright © 2018 Danhloc. All rights reserved.
//

import UIKit

class User: NSObject {
    var fullName: String?
    var email: String?
    var profileImageURL: String?
    convenience init(fullName: String?, email: String?, profileImageURL: String?){
        self.init()
        self.fullName = fullName ?? ""
        self.email = email ?? ""
        self.profileImageURL = profileImageURL ?? ""
    }
}
