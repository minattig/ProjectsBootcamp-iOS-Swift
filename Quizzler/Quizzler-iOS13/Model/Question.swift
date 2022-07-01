//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Gustavo Minatti on 10/05/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    var text: String
    var aswer: String
    
    init(q: String, a: String){
        self.text = q
        self.aswer = a
    }
}
