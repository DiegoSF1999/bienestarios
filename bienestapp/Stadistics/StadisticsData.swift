//
//  StadisticsData.swift
//  bienestapp
//
//  Created by alumnos on 04/02/2020.
//  Copyright © 2020 alumnos. All rights reserved.
//

import Foundation

class StadisticsData{
    
        var app_ids: [Int] = []
        var daily: [Int] = [];
        var weekly: [Int] = [];
        var monthly: [Int] = [];
        
        
        
        init(todo: [[Any]]) {
            
            var days: [Int] = []
            
            if todo.isEmpty {
                
            } else {
                
                
                for i in 0...(todo[0].count-1) {
                    
                    self.app_ids.append(todo[0][i] as! Int)
                    days.append(todo[1][i] as! Int)
                    
                }
                
                
                 for o in 0...(self.app_ids.count-1) {
                    
                    
                        for i in 0...((cellsdatamain?.ids.count)!-1){
                    
                   
                        
                            if self.app_ids[o] == cellsdatamain?.ids[i] {
                            
                                let total: Int = Int((cellsdatamain?.total[o])!)!
                                
                                self.daily.append(Int(total)/days[i])
                                
                                let division_weekly = days[i]/7
                                
                                if (division_weekly > 0){
                                    
                                    self.weekly.append(Int(total)/division_weekly)
                                    
                                    
                                } else {
                                    self.weekly.append(0)
                                }
                                
                                let division_monthly = days[i]/30
                                
                                if (division_monthly > 0){
                                    
                                    self.monthly.append(Int(total)/division_monthly)
                                    
                                    
                                } else {
                                    self.monthly.append(0)
                                }
                                
                                                            
                        }
                        
                    }
                    
                    
                }
                
                
                
            }
            
        }
        
        
        
        
        
    

    
    
    
}
