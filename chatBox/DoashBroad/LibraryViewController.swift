//
//  LibraryViewController.swift
//  MyAppMP3
//
//  Created by Danhloc on 8/6/18.
//  Copyright © 2018 Danhloc. All rights reserved.
//

import UIKit
import  AVFoundation

class LibraryViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func btnSeach(_ sender: Any) {
        
//        let alert = UIAlertController(title: "My Alert", message: "This is an alert.", preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
//            NSLog("The \"OK\" alert occured.")
//        }))
       // self.present(alert, animated: true, completion: nil)
    }
    var library = MusicLibrary().library
    var player : AVAudioPlayer?
    
    var timer : Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animationTable()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return library.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SongTableViewCell", for: indexPath) as! SongTableViewCell
        
        cell.lblIDnumber.text = "\(indexPath.row + 1)"
        cell.songTitleLabel.text = library[indexPath.row]["title"]

        return cell
    }
    

     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
//        performSegue(withIdentifier: "ShowPlayViewController", sender: self)
        
        let detailView = ShowPlayViewController.shared
        detailView.trackId = indexPath.row
        self.navigationController?.show(detailView, sender: nil)
 
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowPlayViewController" {
            let playerVC = segue.destination as! ShowPlayViewController
            let indexPath = tableView.indexPathForSelectedRow!
            playerVC.trackId = indexPath.row
         
        }
    }
    
    
   private func animationTable(){
    tableView.reloadData()
    let cells = tableView.visibleCells
    
    let tableViewHeight = tableView.bounds.size.height
    for cell in cells {
        cell.transform = CGAffineTransform(translationX: 0, y: tableViewHeight)
    }
    
    var delayCounter = 0
    for cell in cells {
        UIView.animate(withDuration: 1.75, delay: Double(delayCounter) * 0.05, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
            cell.transform = CGAffineTransform.identity
        }, completion: nil)
        delayCounter += 1
    }
    
    }
  
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
