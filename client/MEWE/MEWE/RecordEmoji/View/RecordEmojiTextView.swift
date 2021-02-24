//
//  RecordEmojiTextView.swift
//  MEWE
//
//  Created by 1v1 on 2021/02/23.
//

import SwiftUI

struct RecordEmojiTextView: View {
    @Environment(\.presentationMode) private var presentationMode
    @State var txt = ""
    let color: Color
    let cornerRadius: CGFloat
    
    init(color: Color = .gray, cornerRadius: CGFloat = 20.0) {
        self.color = color
        self.cornerRadius = cornerRadius
    }
    var body: some View {
        VStack {
            Text("오늘 기록의 한마디")
                .font(.title)
            Text("일기의 제목처럼 하루의 기분을 한마디로 적어 보세요!")
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .padding(1)
            
            HStack{
                TextField("", text: self.$txt)
                    .padding(.leading)
                    .foregroundColor(color)
                
                Button(action: {
                    withAnimation { self.txt = "" }
                }) {
                    Text("취소").foregroundColor(.black)
                }
                .padding(.horizontal, 8)
            }
            .padding(10)
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(lineWidth: 1.0)
                    .foregroundColor(color)
            )
            .padding(15)
            HStack{
                Spacer()
                Text("15자 제한")
                    .font(.subheadline)
                    .foregroundColor(Color.gray)
                    .multilineTextAlignment(.trailing)
                    .padding(.trailing, 20.0)
            }
            
            Spacer()
        }
        .navigationBarItems(
            leading: LeadingNavView() {
                DispatchQueue.main.async {
                    presentationMode.wrappedValue.dismiss()
                }
            })
        .navigationBarBackButtonHidden(true)
        
        .padding()
    }
}

struct RecordEmojiTextView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RecordEmojiTextView()
            RecordEmojiTextView()
        }
    }
}
