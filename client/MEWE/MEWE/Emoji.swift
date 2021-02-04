//
//  Emoji.swift
//  MEWE
//
//  Created by 1v1 on 2021/01/23.
//

import SwiftUI

class Emoji: Identifiable, ObservableObject{
    let id: UUID
    @Published var mainFeeling: Int
    @Published var feeling: [Int]
    @Published var feelingText: String
    let date: Date
    
    init(id: UUID = UUID(),mainFeeling: Int,feeling: [Int], feelingText: String, date:Date = Date()){
        self.id = id
        self.mainFeeling = mainFeeling
        self.feeling = feeling
        self.feelingText = feelingText
        self.date = date
    }
}

