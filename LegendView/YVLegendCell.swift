//
//  LegendCell.swift
//  LegendView
//
//  Created by yeswanth varma on 7/26/17.
//  Copyright © 2017 DSNY. All rights reserved.
//

import UIKit

class YVLegendCell: UITableViewCell {

    @IBOutlet weak var Indicator: UIImageView!
    @IBOutlet weak var desc: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func Configure(infoObject:infoObject) {
        self.Indicator.image = infoObject.img
        self.desc.text = infoObject.title
    
    }

    
}
