//
//  RegisterViewController.swift
//  bienestapp
//
//  Created by alumnos on 05/02/2020.
//  Copyright © 2020 alumnos. All rights reserved.
//

import UIKit
import Alamofire

class RegisterViewController: UIViewController {

    @IBOutlet weak var name_text: UITextField!
    @IBOutlet weak var email_text: UITextField!
    @IBOutlet weak var password_text: UITextField!
    
    @IBOutlet weak var warning_label: UILabel!
    @IBOutlet weak var button_send: UIButton!
    
    @IBOutlet weak var terms_switch: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()

        saved_token = ""
     
    }
    

   
 
    
    
    
    @IBAction func press_button(_ sender: UIButton) {
    
        if  !self.email_text.text!.isEmpty && terms_switch.isOn{
            
            let params: [String: String] = [
                "name": self.name_text.text!,
                "email": self.email_text.text!,
                "password": self.password_text.text!
            ]
                self.button_send.isEnabled = false
                self.button_send.setTitle("Sending...", for: .normal )
            
        
            Alamofire.request("http://127.0.0.1:8888/Diego/bienestar/public/index.php/api/users", method: .post, parameters: params).responseJSON { response in // method defaults to `.get`
                
                let json = response.result.value
                    
                    self.warning_label.isHidden = true
                    
                    let token: Token = Token(json: json as! [String : Any])
                    
                    saved_token = token.token
                
                    if token.token == "" {
                        self.button_send.isEnabled = true
                        self.warning_label.isHidden = false
                        
                    } else {
                        self.registerApps(name: "instagram")
                    }
                    
                    
                
                
            }
        
        } else {
            
         self.warning_label.isHidden = false
            
            
        }
        
    }
    
    
    func registerApps(name: String){
        
        let params: [String: String] = [
            "name": name
        ]
        
        Alamofire.request("http://127.0.0.1:8888/Diego/bienestar/public/index.php/api/apps", method: .post, parameters: params, headers: ["token": saved_token]).responseJSON { response in // method defaults to `.get`
            
            if response.result.isFailure {
                
               print("esto no deberia pasar")
                
            }
            
        }
    }
    
    
    func getDatafromCSV() {
        sdff
    }
    
 

}
