//
//  RestrictionListAppsViewController.swift
//  bienestapp
//
//  Created by alumnos on 16/01/2020.
//  Copyright © 2020 alumnos. All rights reserved.
//

import UIKit

class RestrictionListAppsViewController: UIViewController,  UITableViewDelegate, UITableViewDataSource {
    
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
        
        let url_converted: URL = URL(string: "https://fatimamartinez.es/wp-content/uploads/2018/09/Instagram-logo-de-600-600x600.jpg")!
        
        cell.app_image.load(url: url_converted)
        cell.app_name.text = cellsdatamain?.names[indexPath.row]
        
        if !(cellsdatarestrictions?.app_ids.isEmpty)! {
            for i in 0...((cellsdatarestrictions?.app_ids.count)!-1) {
                
                if cellsdatarestrictions?.app_ids[i] == cellsdatamain?.ids[indexPath.row] {
                    
                    cell.accessoryType = .checkmark
                    
                }
        }
                    
        }
        
      
   
        
  
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedcell = indexPath.row
        
        
        performSegue(withIdentifier: "RestrictionListToDetail", sender: self)
        
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
