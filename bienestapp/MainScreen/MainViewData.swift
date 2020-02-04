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
    var average_day: [String] = []
    
    
    init(todo: [[String:Any]], daily_usage: [String]) {
      
      
            
            for i in 0...(todo.count-1) {
                
                self.ids.append(todo[i]["id"] as! Int)
                self.names.append(todo[i]["name"] as! String)
                self.icons.append(todo[i]["icon"] as! String)
     
        }
        
        self.daily = daily_usage
        
       
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
                                
                                
                                var double_num: Double = total_use_data[u]["used_time"] as! Double
                                
                                double_num /= 60000.00
                                
                                let int_num:Int = Int(double_num)
                                
                                let def_num: String = String(int_num)
                                
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
                        
                        self.average_day.append("0")
                        
                    }
                } else {
                    
                     var average_use: String = "0"
                    
                    for a in 0...(todo.count-1) {
                        
                        
                        
                        let app_id: Int = todo[a]["id"] as! Int
                        
                       
                        
                        
                        for e in 0...(average_use_data.count-1) {
                            
                            if average_use_data[e]["app_id"] as! Int == app_id {
                                
                            
                                var double_num: Double = average_use_data[e]["used_time"] as! Double
                                
                                double_num /= 60000.00
                                
                                let int_num:Int = Int(double_num)
                                
                                let def_num: String = String(int_num)
                                
                                average_use = def_num
                          
                            
                            
                            
                        }
                            
                            
                        
                        }
                        
                        self.average_day.append(average_use)
                        
                        
                        
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
