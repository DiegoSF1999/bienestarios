//
//  Token.swift
//  bienestapp
//
//  Created by alumnos on 21/01/2020.
//  Copyright © 2020 alumnos. All rights reserved.
//

import Foundation

class Token {
    
    var token: String
    
    init(json: [String: Any]) {
        token = json["token"] as? String ?? ""
    }
}
