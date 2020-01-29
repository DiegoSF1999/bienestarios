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
    var start_hour: [TimeInterval] = []
    var finish_hour: [TimeInterval] = []
    var maximun_time: [TimeInterval] = []
    
    
    
    init(todo: [[String:Any]]) {
        
        
        
        
        for i in 0...(todo.count-1) {
            
            self.app_ids.append(todo[i]["app_id"] as! Int)
            self.start_hour.append(TimeInterval(todo[i]["start_hour"] as! Double))
            self.finish_hour.append(TimeInterval(todo[i]["finish_hour"] as! Double))
            self.maximun_time.append(TimeInterval(todo[i]["maximun_time"] as! Double))
            
            
        }
        
       
        
        
    }
    
    
}

public func StringToData(rawdate: String) -> Date {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "HH:mm:ss"
    
    let date = dateFormatter.date(from:rawdate)!
    
    return date
    
    
}
