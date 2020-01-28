//
//  UsageViewData.swift
//  bienestapp
//
//  Created by alumnos on 28/01/2020.
//  Copyright © 2020 alumnos. All rights reserved.
//

import Foundation
import Alamofire

class UsageViewData {
    
    var date: [String] = []
    var used_time: [String] = []
  
    
    init(todo: [[String:Any]]) {
        
        for i in 0...(todo.count-1) {
            
            self.date.append(todo[i]["date"] as! String)
            
            let string_num: String = todo[i]["used_time"] as! String
            
            let int_num: Int = Int(string_num)! / 60000
            
            let def_num:String = String(int_num)
            
           
            
            self.used_time.append(def_num)
            
            
        }
        
        
    }
        
    

}
