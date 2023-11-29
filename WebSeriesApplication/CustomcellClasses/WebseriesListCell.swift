//
//  WebseriesListCell.swift
//  WebSeriesApplication
//
//  Created by Yudiz-subhranshu on 21/06/23.
//

import UIKit

class WebseriesListCell: UITableViewCell {

    @IBOutlet var webSerieslanguageLbl: UILabel!
    @IBOutlet var webSeriesNamelbl: UILabel!
    @IBOutlet var webSeriesPosterLbl: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
