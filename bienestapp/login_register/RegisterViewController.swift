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

     
    }
    

   
 
    
    
    
    @IBAction func press_button(_ sender: UIButton) {
    
        if  !self.email_text.text!.isEmpty {
            
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
                        self.getMainData()()
                    }
                    
                    
                
                
            }
        
        } else {
            
         self.warning_label.isHidden = false
            
            
        }
        
    }
    
    
    func getMainData(){
        Alamofire.request("http://127.0.0.1:8888/Diego/bienestar/public/index.php/api/myapps", method: .get, headers: ["token": saved_token]).responseJSON { response in // method defaults to `.get`
            
            if response.result.isFailure {
                
               print("esto no deberia pasar")
                
            } else {
                
                let date = Date()
                let format = DateFormatter()
                format.dateFormat = "yyyy-MM-dd"
                let formattedDate = format.string(from: date)
                
                
                let data = response.result.value as! [[String : Any]]
                Alamofire.request("http://127.0.0.1:8888/Diego/bienestar/public/index.php/api/todayuse", method: .post, parameters: ["date":formattedDate], headers: ["token": saved_token]).responseJSON { response in // method defaults to `.get`
                    
                    let data_daily = response.result.value as! [[String : Any]]
                    
                    var daily_use: [String] = []
                    
                    
                    for i in 0...(data.count-1) {
                        
                        var used_time: String = "0"
                        
                        if !data_daily.isEmpty {
                            
                            
                            for o in 0...(data_daily.count-1) {
                                
                                if data[i]["id"] as! Int == data_daily[o]["app_id"] as! Int {
                                    
                                    var double_num: Double = data_daily[o]["used_time"] as! Double
                                    
                                    double_num /= 60000.00
                                    
                                    let int_num:Int = Int(double_num)
                                    
                                    let def_num: String = String(int_num)
                                    
                                    used_time = def_num
                                    
                                }
                                
                            }
                            
                        }
                        
                        
                        daily_use.append(used_time)
                        
                    }
                    
                    
                    cellsdatamain = MainViewData(todo: data, daily_usage: daily_use)
                    
                    Alamofire.request("http://127.0.0.1:8888/Diego/bienestar/public/index.php/api/restrictions", method: .get, headers: ["token": saved_token]).responseJSON { response in // method defaults to `.get`
                        
                        let restriction_data = response.result.value as! [[String : Any]]
                        
                        cellsdatarestrictions = RestrictionData(todo: restriction_data)
                        
                        self.dismiss(animated: true)
                        
                        self.performSegue(withIdentifier: "LoginToMain", sender: Any?.self)
                        
                    }
                    
                    
                    
                    
                }
                
                
            }
            
            
            
        }
    }
 

}
