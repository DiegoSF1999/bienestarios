//
//  ViewController.swift
//  bienestapp
//
//  Created by alumnos on 13/01/2020.
//  Copyright © 2020 alumnos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var didload:Bool = false

    @IBOutlet weak var email_text: UITextField!
    @IBOutlet weak var password_text: UITextField!
    @IBOutlet weak var login_button: UIButton!
    @IBOutlet weak var wrong_crdentials_label: UILabel!
    

    @IBAction func press_login_button(_ sender: UIButton) {
        
        if self.didload {
            
            login_button.setTitle("Loading...", for: .normal )
            
            login_button.isEnabled = false
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        didload = true
         
        
        
    }
    /*
     PARA GUARDAR LOS ICONOS:
     https://rss.itunes.apple.com/es-es
    esto va a ser la hostia*/

}

