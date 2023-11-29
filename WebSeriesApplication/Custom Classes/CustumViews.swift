//
//  any.swift
//  WebSeriesApplication
//
//  Created by Yudiz-subhranshu on 28/06/23.
//

import UIKit

class CustomView: UIView {
    override func awakeFromNib() {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 10
        self.backgroundColor = UIColor.white
    }
}
