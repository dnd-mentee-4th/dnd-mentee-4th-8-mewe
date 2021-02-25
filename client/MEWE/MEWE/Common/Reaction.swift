//
//  Reaction.swift
//  MEWE
//
//  Created by Keunna Lee on 2021/02/25.
//

import Foundation

enum Reaction: String, CaseIterable, CustomStringConvertible {
    var description: String {
        self.rawValue
    }
    
    case thumbUp = "thumbUp", cheeringUp = "cheeringUp", clap = "clap"
}
