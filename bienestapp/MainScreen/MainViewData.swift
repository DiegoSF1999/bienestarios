//
//  MainViewData.swift
//  bienestapp
//
//  Created by alumnos on 23/01/2020.
//  Copyright © 2020 alumnos. All rights reserved.
//

import Foundation
import Alamofire

class MainViewData {
    
    var ids: [Int] = []
    var names: [String] = []
    var icons: [String] = []
    var daily: [String] = []
    var total: [String] = []
    var average: [String] = []
    
    
    init(todo: [[String:Any]]) {
      
      
            
            for i in 0...(todo.count-1) {
                
                self.ids.append(todo[i]["id"] as! Int)
                self.names.append(todo[i]["name"] as! String)
                self.icons.append(todo[i]["icon"] as! String)
                
         
                if todo[0]["used_time"] == nil {
                    self.daily.append("0")
                } else {
                    
                    let string_num: String = todo[i]["used_time"] as! String
                    
                    let int_num: Int = Int(string_num)! / 60000
                    
                    let def_num:String = String(int_num)
                    
                    self.daily.append(def_num)
                }
     
        }
        
        
        
        Alamofire.request("http://127.0.0.1:8888/Diego/bienestar/public/index.php/api/totaluse", method: .get, headers: ["token": saved_token]).responseJSON { response in // method defaults to `.get`
            
            let total_use_data = response.result.value as! [[String : Any]]
            
            if total_use_data.isEmpty {
                
                for i in 0...(todo.count-1) {
                    
                     self.total.append("0")
                    
                }
                
               
            
            
            } else {
                
               
                
                var total_use: String = "0"
                
                for o in 0...(todo.count-1) {
                    
                    total_use = "0"                    
                   
                      
                        let app_id: Int = todo[o]["id"] as! Int
                        
                        
                        
                        
                        for u in 0...(total_use_data.count-1) {
                            
                            if total_use_data[u]["app_id"] as! Int == app_id {
                                
                                
                                total_use = total_use_data[u]["used_time"] as! String
                                
                                let string_num: String = total_use
                                
                                let int_num: Int = Int(string_num)! / 60000
                                
                                let def_num:String = String(int_num)
                                
                                total_use = def_num
                                
                               
                                
                                
                            
                            
                            
                        }
                        
                        
                        
                    }
                    
                    self.total.append(total_use)
                   
                    
                }
                
               
                        
                    }
                    
  
            
            
            Alamofire.request("http://127.0.0.1:8888/Diego/bienestar/public/index.php/api/averageuse", method: .get, headers: ["token": saved_token]).responseJSON { response in // method defaults to `.get`
            
                let average_use_data = response.result.value as! [[String : Any]]
                
                if average_use_data.isEmpty {
                    
                    for i in 0...(todo.count-1) {
                        
                        self.average.append("0")
                        
                    }
                } else {
                    
                     var average_use: String = "0"
                    
                    for a in 0...(todo.count-1) {
                        
                        
                        
                        let app_id: Int = todo[a]["id"] as! Int
                        
                       
                        
                        
                        for e in 0...(average_use_data.count-1) {
                            
                            if average_use_data[e]["app_id"] as! Int == app_id {
                                
                                
                                average_use = average_use_data[e]["used_time"] as! String
                                
                            
                                let string_num: String = average_use
                                
                                let int_num: Double = Double(string_num)! / 60000
                                
                                let def_num:String = String(int_num)
                                
                                average_use = def_num
                          
                            
                            
                            
                        }
                            
                            
                        
                        }
                        
                        self.average.append(average_use)
                        
                        
                        
                    }
                    
                    
                }

    
}
    
    
    }
    /* Alamofire.request("http://127.0.0.1:8888/Diego/bienestar/public/index.php/api/login", method: .post, parameters: parameters).responseJSON { response in
     switch response.result {
     case .success:
     
     print(response)
     
     case let .failure(error):
     print(error)
     }
     
     }*/
    
    }
}
