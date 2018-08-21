//
//  AllbumsViewController.swift
//  MyAppMP3
//
//  Created by Danhloc on 8/9/18.
//  Copyright © 2018 Danhloc. All rights reserved.
//

import UIKit

class AllbumsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

   
    @IBOutlet weak var TableView: UITableView!
    
    var videos : [Video] = [Video]()
    
    var selectVideo : Video?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let videoModel = VideoModel()
        self.videos = videoModel.getvideo()
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = TableView.dequeueReusableCell(withIdentifier: "AllbumsTableViewCell") as! AllbumsTableViewCell
        cell.lblYoutube.text = videos[indexPath.row].videoTitle
        
        let videoStringUrl = "https://i1.ytimg.com/vi/"+videos[indexPath.row].videoId+"/mqdefault.jpg"
        
        let urlLink = URL(string: videoStringUrl)

        let data = try? Data(contentsOf: urlLink!)
           cell.imgYoutube.image = UIImage(data: data!)

        return cell
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
       
        self.selectVideo = self.videos[indexPath.row]
        
         performSegue(withIdentifier: "VideoDetailViewController", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailVideo = segue.destination as!  VideoDetailViewController
        detailVideo.selectVideo = self.selectVideo
        
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
