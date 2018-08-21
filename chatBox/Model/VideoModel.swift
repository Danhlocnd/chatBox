//
//  VideoModel.swift
//  MyAppMP3
//
//  Created by Danhloc on 8/9/18.
//  Copyright © 2018 Danhloc. All rights reserved.
//

import UIKit
class VideoModel: NSObject {
 let API_key = "1000772952855-avno5cnqv99trotjr6q77osvhi2qnic5.apps.googleusercontent.com"
    
//    
//    func getVideoFeed(){
//        Alamofire.request("https://www.googleapis.com/youtube/v3/playlistItems", method: .get, parameters: ["part" : "snippet","playlistId" : ""], encoding: <#T##ParameterEncoding#>, headers: <#T##HTTPHeaders?#>)
//        
//    }
//    
    
    func  getvideo() -> [Video] {
        var videos = [Video]()
        let video1 = Video()
        
        video1.videoId = "kbo-e-01aGk"
        video1.videoTitle = "Vexento - Strobe (Ft. Katie McConnell)"
        video1.videoDescription = "Strobe is back again, with some help from the amazing vocalist Katie McConnell!"
        
        videos.append(video1)
        
        let video2 = Video()
        video2.videoId = "twB_uo6a4UA"
        video2.videoTitle = "Amadeus - Imperious"
        video2.videoDescription = "Strobe is back again, with some help from the amazing vocalist Katie McConnell!"
         videos.append(video2)
        
        let video3 = Video()
        video3.videoId = "6xEfgc23An4"
        video3.videoTitle = "Amadeus - Goodbye"
        video3.videoDescription = "Strobe is back again, with some help from the amazing vocalist Katie McConnell!"
        videos.append(video3)
        
        let video4 = Video()
        video4.videoId = "Sl0JjAivSUI"
        video4.videoTitle = "Amadeus - Imperious"
        video4.videoDescription = "Strobe is back again, with some help from the amazing vocalist Katie McConnell!"
        videos.append(video4)
        
        let video5 = Video()
        video5.videoId = "Sl0JjAivSUI"
        video5.videoTitle = "Amadeus - Superior"
        video5.videoDescription = "Strobe is back again, with some help from the amazing vocalist Katie McConnell!"
        videos.append(video5)
        
        let video6 = Video()
        video6.videoId = "y5GK5gCK9RQ"
        video6.videoTitle = "Amadeus - Imaginary"
        video6.videoDescription = "Strobe is back again, with some help from the amazing vocalist Katie McConnell!"
        videos.append(video6)
        
        let video7 = Video()
        video7.videoId = "n8Y1elVJeDQ"
        video7.videoTitle = "Amadeus - Fortune"
        video7.videoDescription = "Strobe is back again, with some help from the amazing vocalist Katie McConnell!"
        videos.append(video7)
        
        let video8 = Video()
        video8.videoId = "NminLfrD55s"
        video8.videoTitle = "Amadeus - Edge"
        video8.videoDescription = "Strobe is back again, with some help from the amazing vocalist Katie McConnell!"
        videos.append(video8)
        
        let video9 = Video()
        video9.videoId = "04H8TcmUJEo"
        video9.videoTitle = "Amadeus - Icebreaker"
        video9.videoDescription = "Strobe is back again, with some help from the amazing vocalist Katie McConnell!"
        videos.append(video9)
        
        let video10 = Video()
        video10.videoId = "Y5CXeWEuq7I"
        video10.videoTitle = "Top 20 Songs of Vexento 2018 - Best Of Vexento"
        video10.videoDescription = "Strobe is back again, with some help from the amazing vocalist Katie McConnell!"
        videos.append(video10)
        
        let video11 = Video()
        video11.videoId = "aocOIyrvqw4"
        video11.videoTitle = "Lec 25 Alamofire Image & Singleton Class | Swift 4"
        video11.videoDescription = "Strobe is back again, with some help from the amazing vocalist Katie McConnell!"
        videos.append(video11)
        
        
        
        return videos
    }
}
