//
//  RecordEmojiView.swift
//  MEWE
//
//  Created by 1v1 on 2021/01/23.
//

import SwiftUI


struct RecordEmojiView: View {
    @State private var longer: Bool = false
    @State private var text: String = "some text"


    var body: some View {
        VStack {
            Group {
                Text("오늘의 대표 감정은?")
                    .font(.title)
                Text("오늘의 내 기분을 대표하는 감정으로 하루를 기록해 봐요!")
                    .font(.subheadline)
                Text("Settings Panel")
                    .font(.headline)

                TextField("TextField", text: self.$text)
                    .padding(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(Color(UIColor.systemGray2), lineWidth: 1)
                )

                Toggle(isOn: self.$longer) {
                    Text("Advanced")
                }
            }
            .padding()
            .frame(height: 50)
            if self.longer {
                VStack {
                    Text("More settings here...")
                }
                .frame(height: 200)
            }
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
