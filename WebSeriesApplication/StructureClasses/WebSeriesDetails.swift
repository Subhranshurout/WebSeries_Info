//
//  WebSeriesDetails.swift
//  WebSeriesApplication
//
//  Created by Yudiz-subhranshu on 21/06/23.
//

import UIKit

class WebSeriesDetails: NSObject {
    var id : Int
    var name : String
    var language : String
    var poster : String
    var summary : String
    var network : String
    var status : String
    var averageRuntime : Int
    var genres : [String]
    var rating : Any
    
    init(dict : [String : Any]) {
        self.id = dict["id"] as! Int
        self.name = dict["name"] as! String
        self.language = dict["language"] as? String ?? "Unavaliable"
        let image = dict["image"] as? [String : String]
        self.poster = image?["medium"]! ?? ""
        self.summary = dict["summary"] as? String ?? "Unavaliable"
        let name = dict["network"] as? [String : Any]
        self.network = name?["name"] as? String ?? "Unavaliable"
        self.status = dict["status"] as! String
        self.averageRuntime = dict["averageRuntime"] as? Int ?? 0
        self.genres = dict["genres"] as! [String]
        let rattings = dict["rating"] as! [String : Any]
        self.rating = rattings["average"] as? Double ?? "Unavailable"
    }
}
