//
//  SeasonsCell.swift
//  WebSeriesApplication
//
//  Created by Yudiz-subhranshu on 21/06/23.
//

import UIKit

class SeasonsCell: UITableViewCell {

    @IBOutlet var seasonPosterLbl: UIImageView!
    @IBOutlet var seasonNumberLbl: UILabel!
    @IBOutlet var numberOfEpisodes: UILabel!
    @IBOutlet var premeirDataLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
