//
//  RestrictionCellTableViewCell.swift
//  bienestapp
//
//  Created by alumnos on 16/01/2020.
//  Copyright © 2020 alumnos. All rights reserved.
//

import UIKit

class RestrictionCellTableViewCell: UITableViewCell {

    @IBOutlet weak var app_image: UIImageView!
    

    @IBOutlet weak var app_name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func restriction_switch(_ sender: UISwitch) {
        
       // setSelected(true, animated: true)
        
    }
    
    

}
