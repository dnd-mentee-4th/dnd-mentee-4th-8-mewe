//
//  Card.swift
//  MEWE
//
//  Created by Keunna Lee on 2021/02/25.
//

import Foundation

struct Card {
    let representativeEmoji: String
    let title: String
    let nickname: String
    let isFriend: Bool
    let myReaction: [String]
    let totalReaction: String
}

extension Card {
    static var example = Card(representativeEmoji: "행복",
                           title: "좋은 날씨",
                           nickname: "레나",
                           isFriend: false,
                           myReaction: [Reaction.cheeringUp.description, Reaction.thumbUp.description],
                           totalReaction: "74")
}
