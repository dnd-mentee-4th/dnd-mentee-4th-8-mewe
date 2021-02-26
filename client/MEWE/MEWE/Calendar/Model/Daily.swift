//
//  Daily.swift
//  MEWE
//
//  Created by 1v1 on 2021/02/27.
//

import Foundation

struct Daily {
    let date: Date
    let emojiString: String
    let title: String
    let address: String
    let isFriend: Bool
    let totalReaction: String

}

extension Daily {
    static var daily = Daily(date: Date(),
                             emojiString: "emoji_joy",
                             title: "기다리던 여행 날",
                             address: "00 캠핑장",
                             isFriend: false,
                             totalReaction: "29")
}
