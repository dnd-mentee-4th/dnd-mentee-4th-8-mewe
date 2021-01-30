//
//  SelectEmoji.swift
//  MEWE
//
//  Created by 1v1 on 2021/01/23.
//

import SwiftUI

struct SelectEmoji: View {
    @State var text:String = ""
    @State var selectedTitles = Set<String>()
    @State var newEmoji = Emoji(feeling: [], feelingText: "")
    @State var isRecordingOn = false
    @State var isPublic = true
    var body: some View {
            VStack{
                HStack{
                    Toggle(isOn: $isRecordingOn) {
                        Image(systemName: self.isPublic ? "lock.open" : "lock")
                            .font(.system(size: 25, weight:.heavy))
                            .foregroundColor(.black)
                    }
                }
                
               
                CircleView()
                TextField("write down your feeling", text: $text)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
            }
    }
}

struct SelectEmoji_Priviews: PreviewProvider {
    static var previews: some View {
        SelectEmoji()
    }
}
