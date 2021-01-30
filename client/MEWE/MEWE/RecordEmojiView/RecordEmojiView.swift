//
//  RecordEmojiView.swift
//  MEWE
//
//  Created by 1v1 on 2021/01/23.
//

import SwiftUI

struct RecordEmojiView: View {
    @State private var text:String = ""
    @State private var  selectedTitles = Set<String>()
    @State private var newEmoji = Emoji(feeling: [], feelingText: "")
    @State var isRecordingOn = false
    @State var isPublic = true
    var body:some View {
        VStack{
            HStack{
                Toggle(isOn: $isRecordingOn) {
                    Image(systemName: self.isPublic ? "lock.open" : "lock")
                        .font(.system(size: 25, weight:.heavy))
                        .foregroundColor(.black)
                }
            }
            
           
            SelectEmoji()
            TextField("write down your feeling", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
        }
        
        
    }
}

extension RecordEmojiView{
    private func buttonPressed(with title: String){
        // if self.selectedTitles.
    }
}

struct RecordEmojiView_Previews: PreviewProvider {
    static var previews: some View {
        RecordEmojiView()
    }
}
