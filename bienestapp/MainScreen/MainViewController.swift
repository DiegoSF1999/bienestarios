//
//  MainViewController.swift
//  bienestapp
//
//  Created by alumnos on 15/01/2020.
//  Copyright © 2020 alumnos. All rights reserved.
//

import UIKit
import Alamofire

var cellsdatamain: MainViewData? = nil
var selectedcell: Int = 0
var first_var: String = String()
var second_var: String = String()
var third_var: String = String()

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    let arr:[String] = ["uno", "dos", "tres", "cuatro"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
      
            UserDefaults.standard.set(saved_token, forKey: "token")
        
        

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return (cellsdatamain!.names.count)
        
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainCell", for: indexPath) as! MainTableViewCell
        
        let url_converted: URL = URL(string: "https://fatimamartinez.es/wp-content/uploads/2018/09/Instagram-logo-de-600-600x600.jpg")!
        
        cell.app_image.load(url: url_converted)
        cell.app_name.text = cellsdatamain!.names[indexPath.row]
        cell.app_daily_used.text = cellsdatamain!.daily[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.isUserInteractionEnabled = false
        
        
        Alamofire.request("http://127.0.0.1:8888/Diego/bienestar/public/index.php/api/totaluse", method: .get, headers: ["token": saved_token]).responseJSON { response in // method defaults to `.get`
            
            let id_of_app: Int = cellsdatamain!.ids[indexPath.row]
            
            let data = response.result.value as! [[String : Any]]
            
            if data.isEmpty {
                
                print("esta empty")
            } else {
              
                first_var = cellsdatamain!.icons[indexPath.row]
                second_var = cellsdatamain!.names[indexPath.row]
                
                var temp_var:String = "0"
                
                for i in 0...(data.count-1) {
                    
                    
                    
                    if data[i]["app_id"] as! Int == id_of_app {
                        
                        var operation: String = data[i]["used_time"] as! String
                        //operation /= 216000
                        
                        
                        print(Int(operation)!/216000)       // SEGUIR AQUI
                        third_var = operation
                        
                    }
                    
                    
                }
                
              
                
                
                print("tercera es", third_var)
            }
            
           self.performSegue(withIdentifier: "MainToUsage", sender: self)

            
              tableView.isUserInteractionEnabled = true
    
            
       
            
            
            
 
            
            
            
        }
        
      

 
        
    }
    

    
    /*private func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        NSLog("You selected cell number: \(indexPath.row)!")
        self.performSegue(withIdentifier: "app_detail_screen", sender: self)
    }*/
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    


}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
