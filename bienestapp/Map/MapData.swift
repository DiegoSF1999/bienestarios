//
//  MapData.swift
//  bienestapp
//
//  Created by alumnos on 13/02/2020.
//  Copyright © 2020 alumnos. All rights reserved.
//

import Foundation

class MapData {
    
    var name: [String] = []
    var latitude: [Double] = []
    var altitude: [Double] = []

    init(todo: [[String:Any]]) {
        
        for i in 0...todo.count-1 {
            
            for o in 0...(cellsdatamain?.ids.count)!-1 {
              
                let num: Int = todo[i]["app_id"] as! Int
                
                    if num == cellsdatamain?.ids[o] {
                    
                        self.name.append((cellsdatamain?.names[o])!)
                        
                        self.latitude.append(todo[i]["latitude"] as! Double)
                         self.altitude.append(todo[i]["altitude"] as! Double)
                
                }
                
                
            }
            
            
            
            
        }
    
        print("nombres",self.name)
        print(self.latitude)
        print(self.altitude)
    
    
}
}
