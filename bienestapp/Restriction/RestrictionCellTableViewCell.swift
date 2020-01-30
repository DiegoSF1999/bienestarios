//
//  RestrictionCellTableViewCell.swift
//  bienestapp
//
//  Created by alumnos on 16/01/2020.
//  Copyright © 2020 alumnos. All rights reserved.
//

import UIKit
import Alamofire



class RestrictionCellTableViewCell: UITableViewCell {


    @IBOutlet weak var deactivate_button: UIButton!
    @IBOutlet weak var app_image: UIImageView!
    @IBOutlet weak var id_text_field: UITextField!
    @IBOutlet weak var app_name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func app_switch(_ sender: UISwitch) {
        
       
        
     /*   app_switch.isEnabled = false
        
        let id_string:String = id_text_field.text!
        
        let id_int: Int = Int(id_string)!
        
        if app_switch.isOn {
            
            print("ha entrado")
            
            Alamofire.request("http://127.0.0.1:8888/Diego/bienestar/public/index.php/api/restrictionremove", method: .post, parameters: ["app_id": id_int], headers: ["token": saved_token]).responseJSON { response in // method defaults to `.get`
                
                let restriction_data = response.result
                
                print("respuesta: ",restriction_data)
                
            }
            
            
        } else {
            
            
            
        }*/
 
 
    }
    
    

}
