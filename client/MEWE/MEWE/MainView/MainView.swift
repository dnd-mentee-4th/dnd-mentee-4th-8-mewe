//
//  MainView.swift
//  MEWE
//
//  Created by 1v1 on 2021/01/23.
//

import SwiftUI

struct MainView: View {

    var body: some View {
        VStack{
            HStack{
                Button(action: {
                    
                }){
                    Image(systemName: "line.horizontal.3.decrease")
                        .font(.system(size: 25, weight:.heavy))
                        .foregroundColor(.black)
                }
                Spacer(minLength: 0)
                Button(action:{}){
                    Image(systemName: "note.text")
                        .font(.system(size: 25, weight:.heavy))
                        .foregroundColor(.black)
                }
            }
            .padding()
            TodayEmoji()
                .padding()
            Spacer(minLength: 0)
            Button(action: {
                /// RecordEmojiView 로 확장됨
            }, label: {
                Circle()
                    .frame(width: 55, height: 55)
                    .shadow(radius: 5)
                    .foregroundColor(Color.white)
            })
            
            
            
            
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}