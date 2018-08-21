//
//  ShowPlayViewController.swift
//  MyAppMP3
//
//  Created by Danhloc on 8/6/18.
//  Copyright © 2018 Danhloc. All rights reserved.
//

import UIKit
import  AVFoundation
import MediaPlayer

class ShowPlayViewController: UIViewController {
   
    static let shared = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ShowPlayViewController") as! ShowPlayViewController
    
    var CheckTrackId: Int = 0
    var trackId: Int = 0
    var  titletxt :String = ""
    
    var library = MusicLibrary().library
    var audioPlayer: AVAudioPlayer?

    
    var PlacementAnswer = 0
    var click = 0
    var timer : Timer?
    
    
    @IBOutlet weak var coverImageView: UIImageView!
    
    @IBOutlet weak var songTitleLabel: UILabel!
    
    @IBOutlet weak var artistLabel: UILabel!
    
    @IBOutlet weak var lblCurrenTime: UILabel!
    
    @IBOutlet weak var lblEndTime: UILabel!
    
    @IBOutlet weak var sliderTime: UISlider!
    
    @IBAction func btnClose(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)

    }
    
    deinit {
        print("deinit ShowPlayViewController")
    }
    
    @IBAction func btnShuffle(_ sender: UIButton) {
         sender.isSelected = !sender.isSelected
        
        if sender.isSelected == false {
            
        }else
        {
            
        }
        
    }
    
    @IBAction func btnCombinded(_ sender: UIButton) {
         sender.isSelected = !sender.isSelected
        if sender.isSelected == false {
           
           
        }else
        {
         
        }
    }
    

    @IBAction func btnplay(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected == false {
            audioPlayer?.play()
            
            if timer == nil {
                timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updatSlider), userInfo: nil, repeats: true)
                self.runTimer()
            }
        }else
        {
            audioPlayer?.pause()
        }
    }
    
    @IBAction func btnPreviousAction(_ sender: Any) {
        
        if trackId == 0 {
            if (trackId == 0) {
                trackId = 10
            }
        }else{
           trackId -= 1
        }
         self.PlayMusic()
    }
    
   
    @IBAction func btnNextAction(_ sender: Any) {
        
        if trackId == 0 || trackId < 10 {
            trackId += 1
        }else{
            trackId = 0
        }
        self.PlayMusic()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setupLockScreen()
        
        
    }

    override func viewDidAppear(_ animated: Bool) {
        self.PlayMusic()
        
    }
    
    func setupLockScreen(){

        let commandCenter = MPRemoteCommandCenter.shared()
        commandCenter.nextTrackCommand.isEnabled = true
        commandCenter.nextTrackCommand.addTarget(self, action:#selector(skipTrack))
        
        commandCenter.previousTrackCommand.isEnabled = true
        commandCenter.previousTrackCommand.addTarget(self, action:#selector(previousTrack))
        
        commandCenter.playCommand.isEnabled = true
        commandCenter.playCommand.addTarget(self, action: #selector(playScreen))
        
        commandCenter.pauseCommand.isEnabled = true
        commandCenter.pauseCommand.addTarget(self, action: #selector(pauseScreen))
        
       
        MPNowPlayingInfoCenter.default().nowPlayingInfo = [MPMediaItemPropertyTitle: "(\(library[trackId]["title"]!))"]
        
       // print("\(library[trackId]["coverImage"]!)")
        
        let image = UIImage(named: "logo")!
       // print("logo ",image)
        
        let artwork = MPMediaItemArtwork.init(boundsSize: image.size, requestHandler: { (size) -> UIImage in
            return image
        })
        
        MPNowPlayingInfoCenter.default().nowPlayingInfo = [MPMediaItemPropertyArtwork: artwork]
        
    }
    
     @objc func playScreen(){
          audioPlayer?.play()
    }
    @objc func pauseScreen(){
        audioPlayer?.pause()
    }
    
    @objc func skipTrack()  {
        if trackId == 0 || trackId < 10 {
            trackId += 1
        }else{
            trackId = 0
        }
        self.PlayMusic()
        
        MPNowPlayingInfoCenter.default().nowPlayingInfo = [MPMediaItemPropertyTitle: "\(library[trackId]["title"]!)"]
    }
    
    
    
    @objc func previousTrack() {
        if trackId == 0 {
            if (trackId == 0) {
                trackId = 10
            }
        }else{
            trackId -= 1
        }
        self.PlayMusic()
        
        MPNowPlayingInfoCenter.default().nowPlayingInfo = [MPMediaItemPropertyTitle: "\(library[trackId]["title"]!)"]
        
    }
    
    func PlayMusic(){
        UIApplication.shared.beginReceivingRemoteControlEvents()
        
        if let coverImage = library[trackId]["coverImage"]{
            coverImageView.image = UIImage(named:"\(coverImage).jpg")
        }
        
        songTitleLabel.text = library[trackId]["title"]
        artistLabel.text = library[trackId]["artist"]
        
        
        
        let path = Bundle.main.path(forResource: "\(trackId)", ofType: "mp3")
      
        if let path = path {
            let mp3URL = URL(fileURLWithPath: path)
            
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: mp3URL)
                
                audioPlayer?.play()
               
                let fileLong = audioPlayer!.duration
                
                self.sliderTime.maximumValue = Float(fileLong)
                
                let Minutes = Int(fileLong) / 60
                let second = Int(fileLong) - Int(Minutes * 60)
                self.lblEndTime.text = "\(Minutes):\(second)"
                
                if timer == nil {
                    timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updatSlider), userInfo: nil, repeats: true)
                    self.runTimer()
                }
                
                var audioSession = AVAudioSession.sharedInstance()
              
                // play in background
                do {
                    try audioSession.setCategory(AVAudioSessionCategoryPlayback)
                } catch {
                    
                }
                
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        <#code#>
//    }
//
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        <#code#>
//    }

    //update slider follow curren time
    
    @IBAction func SliderTimeChange(_ sender: UISlider) {
        self.audioPlayer?.currentTime = TimeInterval(sender.value)
    }
    
    @objc func updatSlider(){
        guard let currentTime = self.audioPlayer?.currentTime else{
            return
        }
        self.sliderTime.value = Float(currentTime)
        
    }
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(updateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer(){
        
        lblCurrenTime.text = timeString(time: (self.audioPlayer?.currentTime)!)
        
    }
    
    // convert to time
    func timeString(time:TimeInterval) -> String {
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%01i:%02i", minutes, seconds)
    }
    
    

}
