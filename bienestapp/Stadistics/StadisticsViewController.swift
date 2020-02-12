//
//  StadisticsViewController.swift
//  bienestapp
//
//  Created by alumnos on 16/01/2020.
//  Copyright © 2020 alumnos. All rights reserved.
//

import UIKit

var tableview:UITableView? = nil
var picker_row:Int = 0

class StadisticsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
  
    
    
    @IBOutlet weak var app_image: UIImageView!
    @IBOutlet weak var percentage_use: UILabel!
    
    @IBOutlet weak var table_view: UITableView!
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var app_name: UILabel!
    
     let pickerdata:[String] = ["daily", "weekly", "monthly"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview = table_view
        

    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (cellsdatamain?.ids.count)!
        
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StadisticsCell", for: indexPath) as! StadisticsTableViewCell
        
        let url_converted: URL = URL(string: cellsdatamain!.icons[indexPath.row])!
        
        cell.app_image.load(url: url_converted)
        cell.app_name.text = cellsdatamain?.names[indexPath.row]
        
        
        if !(cellsdatastadistics?.app_ids.isEmpty)! {
            
            for i in 0...((cellsdatastadistics?.app_ids.count)!-1) {
                
                if cellsdatastadistics?.app_ids[i] == cellsdatamain?.ids[indexPath.row] {
                    
                    switch picker_row {
                        
                    case 0:
                        let stringed:String = String(cellsdatastadistics!.daily[i])
                        
                        cell.average_use.text = stringed
                        
                        break
                    case 1:
                         let stringed:String = String(cellsdatastadistics!.weekly[i])
                        
                        cell.average_use.text = stringed
                        
                        break
                    case 2:
                        
                        let stringed:String = String(cellsdatastadistics!.monthly[i])
                        
                        cell.average_use.text = stringed
                        
                            break
                    default:
                        break
                    
                  
                    
                    }
                }
            }
            
        } else {
            cell.average_use.text = "0"
        }
        
        
        
        return cell
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerdata.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerdata[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
       
    
        picker_row = row
        
        tableview?.reloadData()
        
            
        
        
        
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
