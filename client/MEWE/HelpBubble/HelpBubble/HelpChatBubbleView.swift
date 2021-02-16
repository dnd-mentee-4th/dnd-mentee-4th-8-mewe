//
//  HelpChatBubbleView.swift
//  HelpBubble
//
//  Created by Keunna Lee on 2021/02/07.
//

import SwiftUI

/*
 도움말 말풍선을 나타내는 View입니다.
 */

public enum BubblePosition {
    case left
    case right
}

public struct HelpChatBubbleView<Content>: View where Content: View {
    
    public typealias MessageText = String
    public let position: BubblePosition
    public let color : Color
    public let content: () -> Content
    
    public init(position: BubblePosition,
                color: Color, @ViewBuilder
                content: @escaping () -> Content) {
        self.content = content
        self.position = position
        self.color = color
     }
    
    public var body: some View {
        HStack(spacing: 0 ) {
            content()
                .padding(.all, 15)
                .foregroundColor(Color.white)
                .background(color)
                .clipShape(RoundedRectangle(cornerRadius: 18))
                .overlay(
                    Image(systemName: "arrowtriangle.left.fill")
                        .foregroundColor(color)
                        .rotationEffect(Angle(degrees: position == .left ? -50 : -130))
                        .offset(x: position == .left ? -5 : 5)
                    ,alignment: position == .left ? .bottomLeading : .bottomTrailing)
        }
        .padding(position == .left ? .leading : .trailing , 15)
        .padding(position == .right ? .leading : .trailing , 60)
        .frame(width: UIScreen.main.bounds.width, alignment: position == .left ? .leading : .trailing)
    }
    
}
