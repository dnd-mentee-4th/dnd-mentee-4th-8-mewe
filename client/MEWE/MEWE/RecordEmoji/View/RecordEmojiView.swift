//
//  RecordEmojiView.swift
//  MEWE
//
//  Created by 1v1 on 2021/01/23.
//

import SwiftUI


struct RecordEmojiView: View {
    var body: some View {
        VStack{
            Text("오늘의 대표 감정은?")
                .font(.title)
            Text("오늘의 내 기분을 대표하는 감정으로 하루를 기록해 봐요!")
                .font(.subheadline)
            
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
