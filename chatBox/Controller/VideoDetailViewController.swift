//
//  VideoDetailViewController.swift
//  MyAppMP3
//
//  Created by Danhloc on 8/10/18.
//  Copyright © 2018 Danhloc. All rights reserved.
//

import UIKit
import WebKit
class VideoDetailViewController: UIViewController {

   
    @IBOutlet weak var VVideoDetail: UIWebView!
    
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var lblDescription: UILabel!
    
    @IBOutlet weak var wvVideoConstantHeight: NSLayoutConstraint!
    
    var selectVideo : Video?
    let width :Int = 320
    let height :Int = 180
  
    @IBAction func btnBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let Vid = self.selectVideo {
            self.lblTitle.text = Vid.videoTitle
            self.lblDescription.text = Vid.videoDescription

            let videoEnbed = "<html><head><style type=\"text/css\">body {background-color: transparent;color: white;}</style></head><body style=\"margin:0\"><iframe frameBorder=\"0\" height=\"" + String(height) + "\" width=\"" + String(width) + "\" src=\"http://www.youtube.com/embed/" + Vid.videoId + "?showinfo=0&modestbranding=1&frameborder=0&rel=0\"></iframe></body></html>"
            
            VVideoDetail.loadHTMLString(videoEnbed, baseURL: nil)
        }
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
