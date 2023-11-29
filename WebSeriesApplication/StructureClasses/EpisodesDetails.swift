//
//  EpisodesDetails.swift
//  WebSeriesApplication
//
//  Created by Yudiz-subhranshu on 21/06/23.
//

import UIKit

class EpisodesDetails: NSObject {
    var name: String
    var seasonNumber : Int
    var episodeNumber : Int
    var still : String
    var summery : String
    var rating : Double
    
    init(dict : [String : Any]) {
        self.name = dict["name"] as? String ?? "Unavailable"
        let image = dict["image"] as? [String : String] ?? [:]
        self.seasonNumber = dict["season"] as! Int
        self.episodeNumber = dict["number"] as? Int ?? 0
        self.still = image["medium"] ?? ""
        let rattings = dict["rating"] as! [String : Any]
        self.rating = rattings["average"] as? Double ?? 0
        self.summery = dict["summary"] as? String ?? "Unavaliable"
    }
}
