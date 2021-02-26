//
//  RecordEmojiCell.swift
//  MEWE
//
//  Created by 1v1 on 2021/02/23.
//

import SwiftUI

struct RecordEmojiCell: View {
    var index:Int
    static let col = 2
    static let row = 5
    let width = (UIScreen.main.bounds.width/2) - 20
    
    private let action: (() -> Void)?
    
    init(action: (() -> Void)? = nil, index:Int) {
        self.action = action
        self.index = index
    }
    
    var body: some View {
        
        Button(action: {
            action?()
        }, label: {
            VStack {
                Image(emojiStrings[index])
                    .resizable()
                    .frame(width: 54.8, height: 54.8)
                    .clipShape(Circle())
                Text(emojiDetails[index])
                    .font(.subheadline)
                    .colorMultiply(.gray)
                    
            }
            .padding(30)
            
        })
        .contentShape(Circle())
        
    }
}
