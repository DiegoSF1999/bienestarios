//
//  RestrictionDetailViewController.swift
//  bienestapp
//
//  Created by alumnos on 16/01/2020.
//  Copyright © 2020 alumnos. All rights reserved.
//

import UIKit
import Alamofire

class RestrictionDetailViewController: UIViewController {
    
    var didexist: Bool = false

    @IBOutlet weak var app_image: UIImageView!
    @IBOutlet weak var app_name: UILabel!
    @IBOutlet weak var allowed_timer: UIDatePicker!
    @IBOutlet weak var app_total_use: UILabel!
    @IBOutlet weak var start_hour_picker: UIDatePicker!
    @IBOutlet weak var finish_hour_picker: UIDatePicker!
    @IBOutlet weak var delete_button: UIButton!
    @IBOutlet weak var save_button: UIButton!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        let url_converted: URL = URL(string: cellsdatamain!.icons[selectedcell])!
        
        app_image.load(url: url_converted)
        app_name.text = cellsdatamain?.names[selectedcell]
        app_total_use.text = cellsdatamain?.total[selectedcell]
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        
        allowed_timer.date = formatter.date(from: "1970/01/01 00:00")!
        
        if (cellsdatarestrictions?.app_ids.isEmpty)! {
        } else {
        
        for i in 0...((cellsdatarestrictions?.app_ids.count)!-1) {
            
            if cellsdatamain?.ids[selectedcell] == cellsdatarestrictions?.app_ids[i] {
                
                didexist = true
                
                let max_time:Int = Int((cellsdatarestrictions?.maximun_time[i])!)
      
                let start_hour: Int = Int((cellsdatarestrictions?.start_hour[i])!)
                
                let finish_hour: Int = Int((cellsdatarestrictions?.finish_hour[i])!)
                
                var date = Date(timeIntervalSince1970: TimeInterval(max_time))
                
                allowed_timer.date = date
                
                date = Date(timeIntervalSince1970: TimeInterval(start_hour))
                
                start_hour_picker.date = date
                
                date = Date(timeIntervalSince1970: TimeInterval(finish_hour))
                
                finish_hour_picker.date = date
                
                
            }
            
            }
            
        }

        // Do any additional setup after loading the view.
        
      
    //    print(allowed_timer.date.timeIntervalSince1970)
        
        // SI LO PASO A MILISEGUNDOS DA -3600, HAY QUE CORREGIRLO DE FORMA LOGICA
        
        if !didexist {
            
            delete_button.isEnabled = false
            
        }
    }
    
    @IBAction func save_button_press(_ sender: UIButton) {
        
        save_button.setTitle("SAVING", for: .normal)
        
        save_button.isEnabled = false
        delete_button.isHidden = true
        
        let params: [String:Any] = ["maximun_time": Int(allowed_timer.date.timeIntervalSince1970), "start_hour": Int(start_hour_picker.date.timeIntervalSince1970), "finish_hour": Int(finish_hour_picker.date.timeIntervalSince1970), "app_id": (cellsdatamain?.ids[selectedcell])!]
        
        if self.didexist {
            
            Alamofire.request("http://127.0.0.1:8888/Diego/bienestar/public/index.php/api/restrictionupdate", method: .post, parameters: params, headers: ["token": saved_token]).responseJSON { response in // method defaults to `.get`
                
                let restriction_data = response.result.value as! Int
                
                self.save_button.setTitle("SAVED", for: .normal)
                
                self.dismiss(animated: true)
            
            }
            
        } else {
            
            Alamofire.request("http://127.0.0.1:8888/Diego/bienestar/public/index.php/api/restrictions", method: .post, parameters: params, headers: ["token": saved_token]).responseJSON { response in // method defaults to `.get`
                
                let restriction_data = response.result.value as! Int
                
                self.save_button.setTitle("SAVED", for: .normal)
                
                 self.dismiss(animated: true)
            }
            
        }        
        
    }
    
    @IBAction func delete_button_press(_ sender: UIButton) {
        
        delete_button.setTitle("DELETING", for: .normal)
        
        save_button.isHidden = true
        delete_button.isEnabled = false
        
        let params: [String:Any] = ["app_id": (cellsdatamain?.ids[selectedcell])!]
        
        Alamofire.request("http://127.0.0.1:8888/Diego/bienestar/public/index.php/api/restrictionremove", method: .post, parameters: params, headers: ["token": saved_token]).responseJSON { response in // method defaults to `.get`
            
            let restriction_data = response.result.value as! Int
            
            self.delete_button.setTitle("DELETED", for: .normal)
            
             self.dismiss(animated: true)
            
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
