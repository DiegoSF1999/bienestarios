//
//  MenuViewController.swift
//  bienestapp
//
//  Created by alumnos on 15/01/2020.
//  Copyright © 2020 alumnos. All rights reserved.
//

import UIKit
import Alamofire

var cellsdatarestrictions: RestrictionData? = nil
var cellsdatastadistics: StadisticsData? = nil
var settings_data: ProfileData? = nil
var notifications_sended = false

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let names:[String] = ["My Apps", "Restrictions", "Stadistics", "My Profile", "Map"]
    let identifiers:[String] = ["MainView", "RestrictionView", "StadisticsView", "ProfileView", "MapView"]
    
    @IBOutlet weak var table_view: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.send_notifications()
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! MenuTableViewCell
        
         cell.label_menu.text = names[indexPath.row]

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
            
        case 1:
            
            Alamofire.request("http://127.0.0.1:8888/Diego/bienestar/public/index.php/api/restrictions", method: .get, headers: ["token": saved_token]).responseJSON { response in // method defaults to `.get`
                
                let restriction_data = response.result.value as! [[String : Any]]
                
                //if !restriction_data.isEmpty {
                    
            
                    cellsdatarestrictions = RestrictionData(todo: restriction_data)
                
   
                    
                    self.performSegue(withIdentifier: self.identifiers[indexPath.row], sender: self)
                    
                //}
                
            }
            
            
            
        break
        case 2:
            
            Alamofire.request("http://127.0.0.1:8888/Diego/bienestar/public/index.php/api/stadistics", method: .get, headers: ["token": saved_token]).responseJSON { response in // method defaults to `.get`
                
                let stadistics_data = response.result.value as! [[Any]]
                
                if !stadistics_data.isEmpty {
                
                
                cellsdatastadistics = StadisticsData(todo: stadistics_data)
                
                
                self.performSegue(withIdentifier: self.identifiers[indexPath.row], sender: self)
                
                }
                
            }
            
        break
        case 3:
            
            Alamofire.request("http://127.0.0.1:8888/Diego/bienestar/public/index.php/api/getmyUser", method: .get, headers: ["token": saved_token]).responseJSON { response in // method defaults to `.get`
                
                let data = response.result.value as! [String:Any]
                
                    
                    settings_data = ProfileData(todo: data)
                    
                    
                    self.performSegue(withIdentifier: self.identifiers[indexPath.row], sender: self)
                    
                
                
            }
            
        break
        default:
    
            performSegue(withIdentifier: identifiers[indexPath.row], sender: self)
            break
            
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
    
    
    func send_notifications() {
        
        
        
        
    }
    
    
}
