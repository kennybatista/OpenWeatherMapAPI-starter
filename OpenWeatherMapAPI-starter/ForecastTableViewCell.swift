//
//  ForecastTableViewCell.swift
//  OpenWeatherMapAPI-starter
//
//  Created by Kenny Batista on 10/3/16.
//  Copyright © 2016 Nikolas Burk. All rights reserved.
//

import UIKit

class ForecastTableViewCell: UITableViewCell {
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
