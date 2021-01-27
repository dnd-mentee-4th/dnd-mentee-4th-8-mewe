//
//  TodayEmoji.swift
//  MEWE
//
//  Created by 1v1 on 2021/01/23.
//

import SwiftUI

struct TodayEmoji: View {
    var body: some View {
        Text("Today Emoji 영역")
            .frame(width: 320, height: 400)
            .background(Color.orange)
    }
}

struct TodayEmoji_Previews: PreviewProvider {
    static var previews: some View {
        TodayEmoji()
    }
}
