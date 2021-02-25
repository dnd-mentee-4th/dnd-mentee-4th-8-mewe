//
//  EmojiCardView.swift
//  MEWE
//
//  Created by Keunna Lee on 2021/02/25.
//

import SwiftUI

struct EmojiCardView: View {
    let card: Card

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .circular)
                .fill(Color.white)
            HStack{
                Image.emoji_heart
                    .modifier(EmojiImageModifier())
            VStack(alignment: .leading, spacing: 5) {
                Text(card.title)
                    .setupFont(size: 20, weight: .bold)

                Text(card.nickname)
                    .setupFont(size: 15, weight: .regular)
            }
            .padding(20)
            .multilineTextAlignment(.center)
                Image.emoji_happiness
                    .modifier(EmojiImageModifier())
                Image.emoji_ease
                    .modifier(EmojiImageModifier())
                Text("74")
                    .setupFont(size: 17,
                               weight: .semibold,
                               foregroundColor: .softBlueDarker)
            }
        }
    }
}

fileprivate struct EmojiImageModifier: ImageModifier {
    func body(image: Image) -> some View {
        image
            .resizable()
            .frame(width: 50, height: 50, alignment: .center)
    }
}
