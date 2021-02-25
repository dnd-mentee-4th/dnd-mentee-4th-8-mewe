//
//  Image.swift
//  MEWE
//
//  Created by Keunna Lee on 2021/02/23.
//

import SwiftUI

extension Image {
    
    // MARK: - Emoji Images
    static let emoji_anger = Image("emoji_anger")
    static let emoji_concern = Image("emoji_concern")
    static let emoji_ease = Image("emoji_ease")
    static let emoji_flustration = Image("emoji_flustration")
    static let emoji_happiness = Image("emoji_happiness")
    static let emoji_heart = Image("emoji_heart")
    static let emoji_joy = Image("emoji_joy")
    static let emoji_proud = Image("emoji_proud")
    static let emoji_sadness = Image("emoji_sadness")
    static let emoji_tiredness = Image("emoji_tiredness")
    static let locationFill = Image(systemName: "location.fill")
    static let network = Image(systemName: "network")
    static let map = Image(systemName: "map")
    static let RecordEmoji_nextBtn = Image("RecordEmoji_nextBtn")
}

protocol ImageModifier {
    associatedtype Body : View

    func body(image: Image) -> Self.Body
}

extension Image {
    func modifier<M>(_ modifier: M) -> some View where M: ImageModifier {
        modifier.body(image: self)
    }
}
