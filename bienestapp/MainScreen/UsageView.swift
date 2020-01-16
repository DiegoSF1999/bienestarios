//
//  UsageView.swift
//  bienestapp
//
//  Created by alumnos on 16/01/2020.
//  Copyright © 2020 alumnos. All rights reserved.
//

import UIKit

class UsageView: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var total_usage: UILabel!
    @IBOutlet weak var app_name: UILabel!
    @IBOutlet weak var app_image: UIImageView!
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "UsageCell", for: indexPath) as! UsageTableViewCell
        
        cell.date_label.text = arr[indexPath.row]
        cell.daily_used_label.text = String(indexPath.row)
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
