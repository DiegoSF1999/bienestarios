//
//  RestrictionListAppsViewController.swift
//  bienestapp
//
//  Created by alumnos on 16/01/2020.
//  Copyright © 2020 alumnos. All rights reserved.
//

import UIKit

class RestrictionListAppsViewController: UIViewController,  UITableViewDelegate, UITableViewDataSource {
    
    let arr:[String] = ["uno", "dos", "tres", "cuatro"]

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestrictionCell", for: indexPath) as! RestrictionCellTableViewCell
        
        cell.app_image.image = #imageLiteral(resourceName: "icon_example")
        cell.app_name.text = arr[indexPath.row]
        
  
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
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
