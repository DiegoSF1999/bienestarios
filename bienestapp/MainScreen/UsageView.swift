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
        
        // esto de momento
         let url_converted: URL = URL(string: "https://fatimamartinez.es/wp-content/uploads/2018/09/Instagram-logo-de-600-600x600.jpg")!
        
        app_image.load(url: url_converted)
        app_name.text = second_var
        total_usage.text = third_var

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellsdatausage?.date.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UsageCell", for: indexPath) as! UsageTableViewCell
        
        cell.date_label.text = cellsdatausage?.date[indexPath.row]
        cell.daily_used_label.text = cellsdatausage?.used_time[indexPath.row]
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
