//
//  RestrictionListAppsViewController.swift
//  bienestapp
//
//  Created by alumnos on 16/01/2020.
//  Copyright © 2020 alumnos. All rights reserved.
//

import UIKit

class RestrictionListAppsViewController: UIViewController,  UITableViewDelegate, UITableViewDataSource {
    
    func press(){
        print("estoy")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (cellsdatamain?.names.count)!
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestrictionCell", for: indexPath) as! RestrictionCellTableViewCell
        
        cell.app_image.image = #imageLiteral(resourceName: "icon_example")
        cell.app_name.text = cellsdatamain?.names[indexPath.row]
        let id: Int = (cellsdatamain?.ids[indexPath.row])!
        
        cell.id_text_field.text = String(id)
        
        for i in 0...((cellsdatarestrictions?.app_ids.count)!-1) {
            
            if cellsdatarestrictions?.app_ids[i] == cellsdatamain?.ids[indexPath.row] {
                
                 cell.accessoryType = .checkmark
                
            }
            
        }
        
      
   
        
  
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
        
        performSegue(withIdentifier: "RestrictionListToDetail", sender: self)
        
    }
    
    public func pressed(){
        print("porva funcuiona")
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
