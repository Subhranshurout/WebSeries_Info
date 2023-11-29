//
//  EpisodesCell.swift
//  WebSeriesApplication
//
//  Created by Yudiz-subhranshu on 21/06/23.
//

import UIKit

class EpisodesCell: UITableViewCell {

    @IBOutlet var episodeImgLbl: UIImageView!
    @IBOutlet var episodeNameLbl: UILabel!
    @IBOutlet var seasonNumberLbl: UILabel!
    @IBOutlet var episodeNumberLbl: UILabel!
    @IBOutlet var ratingdLbl: UILabel!
    @IBOutlet var summeryLbl: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
