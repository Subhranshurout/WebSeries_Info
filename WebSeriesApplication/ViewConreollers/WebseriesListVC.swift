//
//  WebseriesListVC.swift
//  WebSeriesApplication
//
//  Created by Yudiz-subhranshu on 21/06/23.
//

import UIKit
import Kingfisher
import Alamofire

class WebseriesListVC: UIViewController {
    
    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var webSeriesTableView: UITableView!
    
    var webSeriesList = [WebSeriesDetails]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchTextField.addTarget(self, action: #selector(handleSearch), for: .editingChanged)
        alamofireApiCalling(seriesName: "")
        
        let imageIcon = UIImageView()
        imageIcon.image = UIImage(systemName: "magnifyingglass")
        let contentView = UIView()
        contentView.addSubview(imageIcon)
        
        contentView.frame = CGRect(x: 0, y: 0, width: UIImage(systemName: "magnifyingglass")!.size.width + 2, height: UIImage(systemName: "magnifyingglass")!.size.height)
        imageIcon.frame = CGRect(x: 5, y: 0, width: UIImage(systemName: "magnifyingglass")!.size.width, height: UIImage(systemName: "magnifyingglass")!.size.height)
        searchTextField.leftView = contentView
        searchTextField.leftViewMode = .always
        searchTextField.layer.masksToBounds = true
        searchTextField.layer.cornerRadius = 7
    }
    
    @objc func handleSearch() {
        webSeriesList.removeAll()
        let searchedData = searchTextField.text?.lowercased()
        let formattedSearchText = searchedData?.replacingOccurrences(of: " ", with: "-") ?? ""
        alamofireApiCalling(seriesName: formattedSearchText)
        webSeriesTableView.reloadData()
    }
}

//MARK: - TableViewDelegate Methods

extension WebseriesListVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return webSeriesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = webSeriesTableView.dequeueReusableCell(withIdentifier: "WebseriesListCell", for: indexPath) as! WebseriesListCell
        cell.webSeriesNamelbl.text = webSeriesList[indexPath.row].name
        cell.webSerieslanguageLbl.text = webSeriesList[indexPath.row].language
        cell.webSeriesPosterLbl.kf.setImage(with: URL(string: webSeriesList[indexPath.row].poster), placeholder: UIImage(named: "placeholder"))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let destinationVC = self.storyboard?.instantiateViewController(withIdentifier: "ShowWebSeriesInfroVC") as! ShowWebSeriesInfroVC
        destinationVC.navigationItem.title = webSeriesList[indexPath.row].name
        destinationVC.webSeries = webSeriesList[indexPath.row]
        navigationController?.pushViewController(destinationVC, animated: true)
    }
}

//MARK: - Api Calling Method

extension WebseriesListVC {
    func alamofireApiCalling (seriesName : String) {
        let url = "https://api.tvmaze.com/search/shows?q=\(seriesName)"
        AF.request(url).response(completionHandler: { response in
            switch response.result {
            case .success(let data) :
                guard let jsonData = data else {
                    return
                }
                do {
                    self.webSeriesList = [WebSeriesDetails]()
                    let json = try JSONSerialization.jsonObject(with: jsonData) as! [[String : Any]]
                    
                    for i in json {
                        let jdata = i["show"] as! [String: Any]
                        let newSeries = WebSeriesDetails(dict: jdata)
                        self.webSeriesList.append(newSeries)
                    }
                } catch {
                    print(error.localizedDescription)
                }
                DispatchQueue.main.async {
                    self.webSeriesTableView.reloadData()
                }
            case .failure(let error) :
                print(error.localizedDescription)
            }
        })
    }
    
}

