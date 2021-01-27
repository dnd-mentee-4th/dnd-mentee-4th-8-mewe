//
//  emoji.swift
//  MEWE
//
//  Created by 1v1 on 2021/01/23.
//

import SwiftUI

class emoji: Identifiable, ObservableObject{
    let id: UUID
    @Published var feeling: [Image]
    @Published var feelingText: String
    let date: Date
    
    init(id: UUID = UUID(),feeling: [Image], feelingText: String, date:Date = Date()){
        self.id = id
        self.feeling = feeling
        self.feelingText = feelingText
        self.date = date
    }
}

