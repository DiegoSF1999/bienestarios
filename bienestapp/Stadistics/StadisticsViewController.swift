//
//  StadisticsViewController.swift
//  bienestapp
//
//  Created by alumnos on 16/01/2020.
//  Copyright © 2020 alumnos. All rights reserved.
//

import UIKit

class StadisticsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var app_image: UIImageView!
    @IBOutlet weak var percentage_use: UILabel!
    
    @IBOutlet weak var app_name: UILabel!
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "StadisticsCell", for: indexPath) as! StadisticsTableViewCell
        
        cell.app_image.image = #imageLiteral(resourceName: "icon_example")
        cell.app_name.text = arr[indexPath.row]
        cell.average_use.text = String(indexPath.row)
        
        return cell
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
