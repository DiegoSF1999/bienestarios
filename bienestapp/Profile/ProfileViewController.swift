//
//  ProfileViewController.swift
//  bienestapp
//
//  Created by alumnos on 20/01/2020.
//  Copyright © 2020 alumnos. All rights reserved.
//

import UIKit



class ProfileViewController: UIViewController {

    @IBOutlet weak var username_label: UILabel!
    @IBOutlet weak var email_label: UILabel!
    @IBOutlet weak var notifications_switch: UISwitch!
    @IBOutlet weak var messages_switch: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()

        username_label.text = settings_data?.username
        email_label.text = settings_data?.email
        notifications_switch.isOn = settings_data!.notifications
        messages_switch.isOn = settings_data!.messages
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
