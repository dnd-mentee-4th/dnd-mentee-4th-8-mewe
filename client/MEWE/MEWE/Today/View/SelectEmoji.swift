//
//  SelectEmoji.swift
//  MEWE
//
//  Created by 1v1 on 2021/01/23.
//

import SwiftUI

struct SelectEmoji: View {
    @State var text:String = ""
    @State var selectedEmojis = Set<String>()
    @State var newEmoji = Emoji(mainFeeling: 0, feeling: [], feelingText: "")
    @State var isRecordingOn = false
    @State var isPublic = true
    var body: some View {
        CircleView()
    }
}

struct SelectEmoji_Priviews: PreviewProvider {
    static var previews: some View {
        SelectEmoji()
    }
}
