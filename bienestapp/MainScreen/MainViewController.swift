//
//  MainViewController.swift
//  bienestapp
//
//  Created by alumnos on 15/01/2020.
//  Copyright © 2020 alumnos. All rights reserved.
//

import UIKit
import Alamofire
import UserNotifications

var cellsdatamain: MainViewData? = nil
var cellsdatausage: UsageViewData? = nil
var selectedcell: Int = 0

var first_var: String = String()
var second_var: String = String()
var third_var: String = String()

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    let arr:[String] = ["uno", "dos", "tres", "cuatro"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
      
            UserDefaults.standard.set(saved_token, forKey: "token")
        
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) {
            (autorizado, error) in
            if autorizado {
                print("Permiso concedido")
            } else {
                print("Permiso denegado")
            }
        }
        
        
        
        checkRestrictions()
     
        
        

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return (cellsdatamain!.names.count)
        
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainCell", for: indexPath) as! MainTableViewCell
        
        let url_converted: URL = URL(string: cellsdatamain!.icons[indexPath.row])!
        
        cell.app_image.load(url: url_converted)
        cell.app_name.text = cellsdatamain!.names[indexPath.row]
        
        cell.app_daily_used.text = cellsdatamain!.daily[indexPath.row]
            
        
        return cell
       
       
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.isUserInteractionEnabled = false
        
                first_var = cellsdatamain!.icons[indexPath.row]
                second_var = cellsdatamain!.names[indexPath.row]
                third_var = cellsdatamain!.total[indexPath.row]
        
        let app_id: Int = cellsdatamain!.ids[indexPath.row]
        
        
        Alamofire.request("http://127.0.0.1:8888/Diego/bienestar/public/index.php/api/getusages", method: .post, parameters: ["app_id": app_id], headers: ["token": saved_token]).responseJSON { response in // method defaults to `.get`
            
            let usages_data = response.result.value as! [[String : Any]]
            
            if usages_data.isEmpty {
                
            
            } else {
                
                cellsdatausage = UsageViewData(todo: usages_data)
                
            }
   
            
           self.performSegue(withIdentifier: "MainToUsage", sender: self)

            
              tableView.isUserInteractionEnabled = true
     
            
        }
        }
        
      
    func checkRestrictions() {
        
        
        if (cellsdatarestrictions?.app_ids.isEmpty)! {
            
            
        } else {
            
            print("estoy")
            
              for i in 0...(cellsdatamain!.ids.count-1) {
                
                for o in 0...(cellsdatarestrictions?.app_ids.count)!-1 {
                    
                    
                    if cellsdatamain?.ids[i] == cellsdatarestrictions?.app_ids[o] {
                        
                        let max_time = (cellsdatarestrictions?.maximun_time[o])!/60000
                        
                        if max_time < Int((cellsdatamain?.daily[i])!)! {
                            
                            SendNotify(name: (cellsdatamain?.names[i])!)
                            
                            
                            
                        }
                        
                    }
                    
                    
                }
            
        }
            
        }
        
    }
    
    func SendNotify(name: String) {
        
        let contenido = UNMutableNotificationContent()
        contenido.title = "Notificación!"
        contenido.subtitle = "Número de horas superado"
        contenido.body = "Se ha usado " + name + " más del tiempo permitido"
        contenido.sound = UNNotificationSound.default
        contenido.badge = 3
        
        let disparador = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        let peticion = UNNotificationRequest(identifier: "miNotificacion", content: contenido, trigger: disparador)
        
            UNUserNotificationCenter.current().add(peticion, withCompletionHandler: nil)
        
        
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
