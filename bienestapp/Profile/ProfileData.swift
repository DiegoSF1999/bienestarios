//
//  ProfileData.swift
//  bienestapp
//
//  Created by alumnos on 12/02/2020.
//  Copyright © 2020 alumnos. All rights reserved.
//

import UIKit

class ProfileData {

    var username: String
    var email: String
    var notifications: Bool
    var messages: Bool
    
    
    
    init(todo: [String:Any]) {
        
        
        if todo.isEmpty {
            
            self.username = "Internet Error"
            self.email = "Internet Error"
            self.notifications = false
            self.messages = false
            
        } else {
            
            self.username = todo["name"] as! String
            self.email = todo["email"] as! String
            
            
            let status_notifications = UserDefaults.standard.bool(forKey: "notifications") ?? nil
            
            if status_notifications == nil {
                
                self.notifications = true
                UserDefaults.standard.set(true, forKey: "notifications")
               
                
            } else {
                
                self.notifications = status_notifications!
                
            }
            
            let status_messages = UserDefaults.standard.bool(forKey: "messages") ?? nil
            
            if status_messages == nil {
                
                self.messages = true
                UserDefaults.standard.set(true, forKey: "messages")
                
                
            } else {
                
                self.messages = status_messages!
                
            }
            
            
            
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
