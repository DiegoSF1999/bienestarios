//
//  NewPassViewController.swift
//  bienestapp
//
//  Created by alumnos on 12/02/2020.
//  Copyright © 2020 alumnos. All rights reserved.
//

import UIKit
import Alamofire

class NewPassViewController: UIViewController {

    @IBOutlet weak var EditText: UITextField!
    @IBOutlet weak var Button: UIButton!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func press(_ sender: UIButton) {
        
        Button.isEnabled = false
        
        if EditText.text!.isEmpty {
            
            label.isHidden = false
            Button.isEnabled = true
            
        } else {
            
            let params: [String: String] = [
                "password": String(EditText.text!)
            ]
            
            Alamofire.request("http://127.0.0.1:8888/Diego/bienestar/public/index.php/api/reset", method: .post, parameters: params, headers: ["token": saved_token]).responseJSON { response in // method defaults to `.get`
                
                 let json = response.result.value
                
                    let token: Token = Token(json: json as! [String : Any])
                    
                    if token.token == "" {
                       self.label.isHidden = false
                        self.Button.isEnabled = true
                    } else {
                        self.Button.setTitle("DONE", for: .normal)
                        self.label.isHidden = true
                        saved_token = token.token
                    }
       
                
            
            }
          
            
            
        }
        
    }
    
}
