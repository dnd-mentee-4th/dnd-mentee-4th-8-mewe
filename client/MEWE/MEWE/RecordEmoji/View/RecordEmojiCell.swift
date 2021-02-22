//
//  RecordEmojiCell.swift
//  MEWE
//
//  Created by 1v1 on 2021/02/23.
//

import SwiftUI

struct RecordEmojiCell: View {
    static let col = 2
    static let row = 5
    let width = (UIScreen.main.bounds.width/2) - 20
    
    var body: some View {
        
            Circle()
                .fill(Color.white)
                .frame(width: 54.8, height: 54.8)
                .shadow(radius: 5)
                .foregroundColor(Color.white)
                .padding(30)
        
    }
}

struct RecordEmojiCell_Previews: PreviewProvider {
    static var previews: some View {
        RecordEmojiCell()
    }
}
