//
//  SeasonsViewController.swift
//  WebSeriesApplication
//
//  Created by Yudiz-subhranshu on 21/06/23.
//

import UIKit
import Kingfisher
import Alamofire

class SeasonsViewController: UIViewController {
    
    @IBOutlet var seasonsTableView : UITableView!
    
    var seasonList = [SeasonDetails]()
    var seriesId = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        alamofireapiCallingFetchingSeasonsData(show_id: String(seriesId))
    }
}

//MARK: - TableView Delegate Methods

extension SeasonsViewController : UITableViewDelegate ,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return seasonList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = seasonsTableView.dequeueReusableCell(withIdentifier: "SeasonsCell", for: indexPath) as! SeasonsCell
        cell.numberOfEpisodes.text = "Episodes :\(seasonList[indexPath.row].numberOfEpisodes)"
        cell.premeirDataLbl.text = "Premiere Data :\(seasonList[indexPath.row].premiereData)"
        cell.seasonNumberLbl.text = "Season Number :\(seasonList[indexPath.row].seasonNumer)"
        cell.seasonPosterLbl.kf.setImage(with: URL(string: seasonList[indexPath.row].poster),placeholder: UIImage(named: "placeholder"))
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let destinationVC = self.storyboard?.instantiateViewController(withIdentifier: "EpisodesVC") as! EpisodesVC
        destinationVC.seasonID = seasonList[indexPath.row].id
        navigationController?.pushViewController(destinationVC, animated: true)
    }
    
}

//MARK: - API Calling Method

extension SeasonsViewController {
    func alamofireapiCallingFetchingSeasonsData (show_id :String) {
        let url = "https://api.tvmaze.com/shows/\(show_id)/seasons"
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
                        let newSeason = SeasonDetails(dict: jdata)
                        self.seasonList.append(newSeason)
                    }
                } catch {
                    print(error.localizedDescription)
                }
                DispatchQueue.main.async {
                    self.seasonsTableView.reloadData()
                }
            case .failure(let error) :
                print(error.localizedDescription)
            }
        })
    }
//    func fetchSeasonsData (show_id :String) {
//        let url = "https://api.tvmaze.com/shows/\(show_id)/seasons"
//        guard let counryUrl = URL(string: url) else {
//            return
//        }
//        var request = URLRequest(url: counryUrl)
//        request.httpMethod = "GET"
//        let session = URLSession.shared
//
//        let task = session.dataTask(with: request, completionHandler: {data,response,error -> Void in
//            guard let jsonData = data else {
//                return
//            }
//
//            do {
//                let json = try JSONSerialization.jsonObject(with: jsonData) as! [[String : Any]]
//                for jdata in json {
//                    let newSeason = SeasonDetails(dict: jdata)
//                    self.seasonList.append(newSeason)
//                }
//            } catch {
//                print(error.localizedDescription)
//            }
//            DispatchQueue.main.async {
//                self.seasonsTableView.reloadData()
//            }
//        })
//        task.resume()
//    }
}
