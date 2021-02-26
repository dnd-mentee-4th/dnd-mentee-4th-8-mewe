//
//  Daily.swift
//  MEWE
//
//  Created by 1v1 on 2021/02/27.
//

import Foundation
import SwiftUI

struct Daily {
    var date: Date
    var emojiImage: Image
    var title: String
    var address: String
    var isSharedOn: Bool
    var totalReaction: String

}

extension Daily {
    static var daily = Daily(date: Date(),
                             emojiImage: Image.emoji_joy,
                             title: "기다리던 여행 날",
                             address: "00 캠핑장",
                             isSharedOn: true,
                             totalReaction: "29")
}
