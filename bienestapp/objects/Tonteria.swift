//
//  Tonteria.swift
//  bienestapp
//
//  Created by alumnos on 21/01/2020.
//  Copyright © 2020 alumnos. All rights reserved.
//

import Foundation

class Tonteria {
    var quote: String
    
    init(json: [String: Any]) {
        quote = json["quote"] as? String ?? ""
    }
}
