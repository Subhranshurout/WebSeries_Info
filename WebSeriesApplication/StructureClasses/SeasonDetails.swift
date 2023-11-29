//
//  SeasonDetails.swift
//  WebSeriesApplication
//
//  Created by Yudiz-subhranshu on 21/06/23.
//

import UIKit

class SeasonDetails: NSObject {
    var id : Int
    var poster: String
    var seasonNumer : Int
    var numberOfEpisodes : Int
    var premiereData : String
    
    init(dict : [String : Any]) {
        self.id = dict["id"] as! Int
        let image = dict["image"] as? [String : String]
        self.poster = image?["medium"] as? String ?? ""
        self.seasonNumer = dict["number"] as! Int
        self.numberOfEpisodes = dict["episodeOrder"] as? Int ?? 0
        self.premiereData = dict["premiereDate"] as? String ?? "Unavaliable"
    }
}
