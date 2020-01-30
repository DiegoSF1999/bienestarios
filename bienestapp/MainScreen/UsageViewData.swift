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
            
            let raw_num: Double = todo[i]["used_time"] as! Double
            
            let double_num: Double = raw_num / 60000.00
            
            let int_num: Int = Int(double_num)
            
            let def_num:String = String(int_num)
            
           
            
            self.used_time.append(def_num)
            
            
        }
        
        
    }
        
    

}
