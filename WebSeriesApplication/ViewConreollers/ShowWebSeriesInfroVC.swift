//
//  ShowWebSeriesInfroVC.swift
//  WebSeriesApplication
//
//  Created by Yudiz-subhranshu on 21/06/23.
//

import UIKit
import Kingfisher
class ShowWebSeriesInfroVC: UIViewController , UIScrollViewDelegate {
    
    
    @IBOutlet var webSeriesPosterLbl: UIImageView!
    @IBOutlet var webSeriesNameLbl: UILabel!
    @IBOutlet var webSerieslanguageLbl: UILabel!
    @IBOutlet var webSeriesGenresLbl: UILabel!
    @IBOutlet var webSeriesStatusLbl: UILabel!
    @IBOutlet var webSeriesNetworkLbl: UILabel!
    @IBOutlet var webSeriesAverageRunTimeLbl: UILabel!
    @IBOutlet var webSeriesRattingLbl: UILabel!
    @IBOutlet var webSeriesSummerylbl: UILabel!
    @IBOutlet var moreBtn: UIButton!
    @IBOutlet var scrollView: UIScrollView!
    
    var isExpanded = false
    var genres = ""
    var webSeries : WebSeriesDetails!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webSeriesPosterLbl.kf.setImage(with: URL(string: webSeries.poster),placeholder: UIImage(named: "placeholder"))
        webSeriesNameLbl.text = "\(webSeries.name)"
        webSerieslanguageLbl.text = "\(webSeries.language)"
        for i in webSeries.genres {
            genres.append(i)
        }
        webSeriesGenresLbl.text = "\(genres)"
        webSeriesStatusLbl.text = "\(webSeries.status)"
        webSeriesNetworkLbl.text = "\(webSeries.network)"
        webSeriesAverageRunTimeLbl.text = "\(webSeries.averageRuntime)"
        webSeriesRattingLbl.text = "\(webSeries.rating)"
        if webSeries.summary == "Unavaliable" {
            moreBtn.isHidden = true
        }
        webSeriesSummerylbl.text = webSeries.summary
        
        webSeriesSummerylbl.numberOfLines = 2
        scrollView.delegate = self
    }
    
    
    @IBAction func moreBtnClick(_ sender: Any) {
        isExpanded.toggle()
        if isExpanded {
            webSeriesSummerylbl.numberOfLines = 0
            moreBtn.setTitle("Less", for: .normal)
        } else {
            webSeriesSummerylbl.numberOfLines = 2
            moreBtn.setTitle("More", for: .normal)
        }
        scrollView.layoutIfNeeded()
    }
    @IBAction func seasonsVCOpenBtnClick(_ sender: UIBarButtonItem) {
        let destinationVC = self.storyboard?.instantiateViewController(withIdentifier: "SeasonsViewController") as! SeasonsViewController
        destinationVC.navigationItem.title = webSeries.name
        destinationVC.seriesId = webSeries.id
        navigationController?.pushViewController(destinationVC, animated: true)
    }
    
}
