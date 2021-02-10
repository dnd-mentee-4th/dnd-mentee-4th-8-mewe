//
//  EmotionAnalysis.swift
//  MEWE
//
//  Created by Keunna Lee on 2021/02/10.
//

import Foundation

struct EmotionAnalysis: Identifiable {
    var id: UUID = UUID()
    
    let description: String
    let changes: String
    let trend: Trend
}
