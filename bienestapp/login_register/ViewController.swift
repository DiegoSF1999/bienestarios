//
//  ViewController.swift
//  bienestapp
//
//  Created by alumnos on 13/01/2020.
//  Copyright © 2020 alumnos. All rights reserved.
//

import UIKit
import Alamofire

var answer: String = ""

class ViewController: UIViewController {
    
    var didload:Bool = false

    @IBOutlet weak var email_text: UITextField!
    @IBOutlet weak var password_text: UITextField!
    @IBOutlet weak var login_button: UIButton!
    @IBOutlet weak var wrong_crdentials_label: UILabel!
    

    @IBAction func press_login_button(_ sender: UIButton) {
        
        if self.didload {
            
            let parameters: [String: String] = [
              //  "email": email_text.text!,
              //  "password": password_text.text!
                "email": "cevasdf1234@yopmail.com",
                "password": "O0rwW9c8"
            ]
            
            // LoginToMain
            
            login_button.setTitle("Loading...", for: .normal )
            
            login_button.isEnabled = false
            
            performSegue(withIdentifier   : String, sender: Any?)
         
            /* Alamofire.request("http://127.0.0.1:8888/Diego/bienestar/public/index.php/api/users").responseJSON { response in // method defaults to `.get`
                print(response)
             }
 */
            
          
                
            /* Alamofire.request("http://127.0.0.1:8888/Diego/bienestar/public/index.php/api/login", method: .post, parameters: parameters).responseJSON { response in
                    switch response.result {
                    case .success:
                        
                     print(response)
                       
                    case let .failure(error):
                        print(error)
                    }
                
            }*/
        
         //   let reqsinv = Requests()
            
            let eltoken: String = self.login(email: "cevasdf1234@yopmail.com", password: "O0rwW9c8")
            
           
            
            
            
            print(answer)
            
           // reqsinv.getTonterias()
        
            
         
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        didload = true
      
         
        
        
    }
    
    public func login(email: String, password:String) -> String {
        let url = URL(string: "http://127.0.0.1:8888/Diego/bienestar/public/index.php/api/login")
        let params = ["email": email, "password": password]
        
        
        Alamofire.request(url!, method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            
            if let json = response.result.value {
                
                let token: Token = Token(json: json as! [String : Any])
                
                self.write(texto: token.token)
                
                
            }
            
            //aqui se salvan datos
            
        }
        
        //aqui no
        //print("answer es_ " + answer)
        return answer
        
    }
    
    func write(texto: String){
        
        answer += texto
        
        print(answer + " _aqui deberia haber algo")
        
        
    }
    
    public func getUsers() {
        
    }
    /*
     PARA GUARDAR LOS ICONOS:
     https://rss.itunes.apple.com/es-es
    esto va a ser la hostia*/

}

