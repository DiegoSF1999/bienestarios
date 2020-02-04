//
//  RestrictionData.swift
//  bienestapp
//
//  Created by alumnos on 29/01/2020.
//  Copyright © 2020 alumnos. All rights reserved.
//

import Foundation

class RestrictionData {
    
    var app_ids: [Int] = []
    var start_hour: [Int] = []
    var finish_hour: [Int] = []
    var maximun_time: [Int] = []
    
    
    
    init(todo: [[String:Any]]) {
        
       
        if todo.isEmpty {
            
        } else {
            
        
        for i in 0...(todo.count-1) {
            
            self.app_ids.append(todo[i]["app_id"] as! Int)
            self.start_hour.append(todo[i]["start_hour"] as! Int)
            self.finish_hour.append(todo[i]["finish_hour"] as! Int)
            self.maximun_time.append(todo[i]["maximun_time"] as! Int)
            
            
        }
        
       
        }
        
    }
    
    

    
    
}
