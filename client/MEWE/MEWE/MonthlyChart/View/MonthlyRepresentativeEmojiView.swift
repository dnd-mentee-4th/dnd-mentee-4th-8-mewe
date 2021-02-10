//
//  MonthlyRepresentativeEmojiView.swift
//  MEWE
//
//  Created by Keunna Lee on 2021/02/10.
//

import SwiftUI

struct MonthlyRepresentativeEmojiView: View {
    var body: some View {
        HStack {
            Text("이달의 대표 감정")
            Button(action: {}){
                   VStack{
                    Text("행복")
                        .setupFont(size: 20, weight: .bold)
                    Text("+4%")
                        .setupFont(size: 15, weight: .light, foregroundColor: .white)
                   }
                   .padding(40)
                   .background(Color.orange)
                   .font(.headline)
                   .mask(Circle())
               }
               .buttonStyle(PlainButtonStyle())
        }
    }
}
