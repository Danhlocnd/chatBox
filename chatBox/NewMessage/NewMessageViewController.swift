//
//  NewMessageViewController.swift
//  chatBox
//
//  Created by Danhloc on 8/21/18.
//  Copyright © 2018 Danhloc. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class NewMessageViewController: UITableViewController {
    let cellId = "NewMessageTableCell"
    var users = [User]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let leftBarButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self,
                                            action: #selector(handleCancel))
        navigationItem.setLeftBarButton(leftBarButton, animated: true)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        fetchUsersFromFirebase()
    }

    
    func fetchUsersFromFirebase() {
        Database.database().reference().child("users").observe(.value) { (snapshot) in
            if let dictionary = snapshot.value as? [String: Any] {
                let userIds = Array(dictionary.keys)
                for userId in userIds {
                    if let dictUser = dictionary[userId] as? [String: Any] {
                        let user = User(fullName: dictUser["fullName"] as? String,
                                        email: dictUser["email"] as? String,
                                        profileImageURL: dictUser["profileImageURL"] as? String)
                        //Now we need to insert to an array of user's objects
                        self.users.append(user)
                        DispatchQueue.main.async {
                            self.tableView.reloadData()//This is a "Main" process = UI process
                        }
                    }
                }
            }
        }
    }
    
    @objc func handleCancel(){
        dismiss(animated: true, completion: nil)
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewMessageTableCell", for: indexPath)
        let user = users[indexPath.row]
        cell.textLabel?.text = "\(user.fullName) : \(user.email)"
        //Now we need to show Image Profile  and fullname, email with better UI ?
        //See in the next lesson :)
        
        return cell
    }
 
}
