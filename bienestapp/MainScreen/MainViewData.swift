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
    
    
    init(todo: [[String:Any]]) {
                
        for i in 0...(todo.count-1) {
            
            self.ids.append(todo[i]["id"] as! Int)
            self.names.append(todo[i]["name"] as! String)
            self.icons.append(todo[i]["icon"] as! String)
            self.daily.append(todo[i]["used_time"] as! String)
            
        }
        
 

   // public func getappsdata(token:String){
        
    
        
        
         
            
         
            
   //     }
        
    
    
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
