//
//  RecordEmojiWhereView.swift
//  MEWE
//
//  Created by 1v1 on 2021/02/23.
//

import SwiftUI

struct RecordEmojiWhereView: View {
    var body: some View {
        NavigationView{
            VStack {
                Text("오늘 하루를 어디에서 보냈나요?")
                    .font(.title)
                Text("감정 기록 잠금 해제 후, 감정 지도에서\n사람들에게 공유하고 공감을 얻을 수 있어요!")
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                Button(action: {}, label: {
                    NavigationLink(
                        destination: EmptyView()){
                        Text("감정 지도 바로가기")
                            .overlay(
                                RoundedRectangle(cornerRadius: 8.0)
                                    .stroke(lineWidth: 2.0)
                                    .foregroundColor(.blue)
                                    
                            ).padding()
                    }
                })
                .padding()
            }
            
            .navigationBarItems(leading: LeadingNavView(), trailing: TrailingNavViewForWhere())
        }
        .navigationBarBackButtonHidden(true)

        .padding()
    }
}
struct TrailingNavViewForWhere: View {
    var body: some View {
        NavigationLink(
            destination: RecordEmojiTextView()){
            Image("RecordEmoji_nextBtn")
                .font(.system(size: 25, weight:.heavy))
                .foregroundColor(.black)
        }
    }
}

struct RecordEmojiWhereView_Previews: PreviewProvider {
    static var previews: some View {
        RecordEmojiWhereView()
    }
}
