//
//  RestrictionDetailViewController.swift
//  bienestapp
//
//  Created by alumnos on 16/01/2020.
//  Copyright © 2020 alumnos. All rights reserved.
//

import UIKit

class RestrictionDetailViewController: UIViewController {

    @IBOutlet weak var allowed_timer: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        
        allowed_timer.date = formatter.date(from: "1970/01/01 00:00")!
        print(allowed_timer.date.timeIntervalSince1970)
        
        // SI LO PASO A MILISEGUNDOS DA -3600, HAY QUE CORREGIRLO DE FORMA LOGICA
        
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
