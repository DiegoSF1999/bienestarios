//
//  RecoverViewController.swift
//  bienestapp
//
//  Created by alumnos on 05/02/2020.
//  Copyright © 2020 alumnos. All rights reserved.
//

import UIKit
import Alamofire

class RecoverViewController: UIViewController {
    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var text_error: UILabel!
    
    @IBOutlet weak var text_email: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    @IBAction func press_recover(_ sender: UIButton) {
    
    
        
        if text_email.text!.isEmpty {
        } else {
        
        let params: [String: String] = [
            "email": text_email.text!
        ]
        
        button.setTitle("Loading...", for: .normal )
        
        button.isEnabled = false

    
    
            Alamofire.request("http://127.0.0.1:8888/Diego/bienestar/public/index.php/api/recover", method: .post, parameters: params).responseJSON { response in // method defaults to `.get`
                
                if response.result.value as! Int == 200 {
                    self.text_error.isHidden = true

                    self.button.setTitle("Check Email", for: .normal)
                } else {
                    
                    self.text_error.isHidden = false
                    self.button.isEnabled = true
                    self.button.setTitle("SEND NEW PASS", for: .normal)
                    
                }
                
                
               
            

            
            
            

            


            }}}}
