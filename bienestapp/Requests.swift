//
//  Requests.swift
//  bienestapp
//
//  Created by alumnos on 21/01/2020.
//  Copyright © 2020 alumnos. All rights reserved.
//

import Foundation
import Alamofire

class Requests {
    
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
    
    public func getAnswer() -> String
    {
        return answer
    }
    
    func getTonterias() {
        let url = "https://tonterias.herokuapp.com/api/tonterias"
        Alamofire.request(url).responseJSON { (response) in
            if let json = response.result.value {
                
                let jsonParseado = json as! [[String: Any]]
                var tonterias: [Tonteria] = []
                
                for tonteria in jsonParseado {
                    tonterias.append(Tonteria(json: tonteria))
                }
                
                for tonteria in tonterias {
                    print(tonteria.quote)
                }
            }
        }
    }
    
}
