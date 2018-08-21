//
//  HomeViewController.swift
//  MyAppMP3
//
//  Created by Danhloc on 8/7/18.
//  Copyright © 2018 Danhloc. All rights reserved.
//

import UIKit
import ImageIO

class HomeViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    @IBOutlet weak var NewCollectionView: UICollectionView!
    @IBOutlet weak var gifImg: UIImageView!
    
    var imgList = MusicLibrary().imgList
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlGif = "https://tinhte.cdnforo.com/store/2016/01/xengallery_photos_l_46306_a2f7cfd33883b9e2cd4634fda72a2a66.gif"

        gifImg.image = UIImage.gif(url: urlGif)
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewCollectionViewCell", for: indexPath) as! NewCollectionViewCell
        
        cell.LblNew.text = imgList[indexPath.row]["title"]
        cell.NewImgView.image = UIImage(named: "\(imgList[indexPath.row]["coverImage"]!).jpg" )
       
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let detailView = ShowPlayViewController.shared
        detailView.trackId = indexPath.row
        self.navigationController?.show(detailView, sender: nil)
//
//        //performSegue(withIdentifier: <#T##String#>, sender: <#T##Any?#>)
//        let DetailCollectionCell = storyboard?.instantiateViewController(withIdentifier: "ShowPlayViewController") as! ShowPlayViewController
//        DetailCollectionCell.trackId = indexPath.row
//        self.navigationController?.show(DetailCollectionCell, sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowPlayViewController" {
            let playerVC = segue.destination as! ShowPlayViewController
            let indexPath = NewCollectionView.indexPathsForSelectedItems!
            //playerVC.trackId = indexPath.
            
        }
    }
    

}


    

