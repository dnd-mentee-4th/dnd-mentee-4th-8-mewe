//
//  TodayEmojiView.swift
//  MEWE
//
//  Created by 1v1 on 2021/01/23.
//

import SwiftUI

struct TodayEmojiView: View {
    @State var isRecordingOn = true
    var body: some View {
        VStack(){
            Toggle(isOn: $isRecordingOn){
            }
            .padding()
            Text("Today Emoji 영역")
                .frame(width: 311, height: 372)
                .background(Color.gray)
                
        }
        .padding()
    }
        
}

struct TodayEmoji_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TodayEmojiView()
            TodayEmojiView()
        }
    }
}
