//
//  EmojiCalendarWeekView.swift
//  MEWE
//
//  Created by 1v1 on 2021/02/27.
//

import SwiftUI

struct EmojiCalendarWeekView: View {
    var daily: Daily
    var todayDate: Date
    init(today: Date, daily: Daily) {
        self.todayDate = today
        self.daily = daily
    }
    @State var isSharedOn = true
    var body: some View {
        VStack{
            Text(daily.title)
            daily.emojiImage
                .resizable()
                .frame(width: 197, height: 197, alignment: .center)
                .shadow(color: .gray, radius: 10, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 4)
            
            HStack {
                VStack {
//                    Toggle(isOn: $isSharedOn, label: {
//                        
//                    })
                    Image(systemName: "mappin.and.ellipse")
                        .resizable()
                        .frame(width: 24, height: 25, alignment: .center)
                        .foregroundColor(.softBlue)
                    Text(daily.address)
                        .font(.subheadline)
                    NavigationLink(
                        destination: EmptyView()){
                        Text("상세 주소 보기 ")
                            .foregroundColor(.softBlueDarker)
                            .background(RoundedRectangle(cornerRadius: 50)
                                            .fill(Color.veryLightBlue)
                                            .frame(width: 129, height: 31, alignment: .center))
                            .padding()
                    }
                        
                }
                .padding(.trailing)
                
                VStack {
                    Image(systemName: "heart")
                        .resizable()
                        .frame(width: 29, height: 25, alignment: .center)
                        .foregroundColor(.softBlue)
                    Text(daily.totalReaction + "명의 공감")
                        .font(.subheadline)
                    NavigationLink(
                        destination: EmptyView()){
                        Text("공감하러 가기")
                            .foregroundColor(.softBlueDarker)
                            .background(RoundedRectangle(cornerRadius: 50)
                                            .fill(Color.veryLightBlue)
                                            .frame(width: 129, height: 31, alignment: .center))
                            .padding()
                    }
                    
                }
                .padding(.leading)
            } // H
            .padding()
        }
        
        
        
    }
}

struct EmojiCalendarWeekView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiCalendarWeekView(today: Date(), daily: Daily(date: Date(),
                                                          emojiImage: Image.emoji_joy,
                                                          title: "기다리던 여행 날",
                                                          address: "00 캠핑장",
                                                          isSharedOn: true,
                                                          totalReaction: "29"))
    }
}
