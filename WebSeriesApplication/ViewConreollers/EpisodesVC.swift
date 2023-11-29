//
//  EpisodesVC.swift
//  WebSeriesApplication
//
//  Created by Yudiz-subhranshu on 21/06/23.
//

import UIKit
import Kingfisher
import Alamofire

class EpisodesVC: UIViewController {

    @IBOutlet var episodesTableView: UITableView!
    
    var episodesList = [EpisodesDetails]()
    var seasonID = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        alamofireapiCallingFetchingEpisodesData(season_id: "\(seasonID)")
    }

}

//MARK: - TableView Delegate Methods
extension EpisodesVC :UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = episodesTableView.dequeueReusableCell(withIdentifier: "EpisodesCell", for: indexPath) as! EpisodesCell
//        cell.episodeImgLbl.downloadImage(url: )
        cell.episodeImgLbl.kf.setImage(with: URL(string: episodesList[indexPath.row].still),placeholder: UIImage(named: "placeholder"))
        cell.seasonNumberLbl.text = "Season Number :\(episodesList[indexPath.row].seasonNumber)"
        cell.episodeNameLbl.text = "Episode name :\(episodesList[indexPath.row].name)"
        cell.episodeNumberLbl.text = "Episode number :\(episodesList[indexPath.row].episodeNumber)"
        cell.ratingdLbl.text = "Episode Rating :\(episodesList[indexPath.row].rating)"
        cell.summeryLbl.text = "\(episodesList[indexPath.row].summery)"
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}

//MARK: - API Calling Metho
extension EpisodesVC {
    func alamofireapiCallingFetchingEpisodesData (season_id :String) {
        let url = "https://api.tvmaze.com/seasons/\(season_id)/episodes"
        AF.request(url).response(completionHandler: { response in
            switch response.result {
            case .success(let data) :
                guard let jsonData = data else {
                    print("Invalid Data")
                    return
                }
                do {
                    let json = try JSONSerialization.jsonObject(with: jsonData) as! [[String : Any]]
                    for jdata in json {
                        let newSeason = EpisodesDetails(dict: jdata)
                        self.episodesList.append(newSeason)
                    }
                } catch {
                    print(error.localizedDescription)
                }
                DispatchQueue.main.async {
                    self.episodesTableView.reloadData()
                }
                
            case .failure(let error) :
                print(error.localizedDescription)
            }
        })
    }
}
