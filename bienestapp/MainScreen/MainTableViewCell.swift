//
//  MainTableViewCell.swift
//  bienestapp
//
//  Created by alumnos on 15/01/2020.
//  Copyright © 2020 alumnos. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    @IBOutlet weak var app_daily_used: UILabel!
    
    @IBOutlet weak var app_name: UILabel!
    @IBOutlet weak var app_image: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
