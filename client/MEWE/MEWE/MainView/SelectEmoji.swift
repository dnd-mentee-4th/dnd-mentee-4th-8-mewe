//
//  SelectEmoji.swift
//  MEWE
//
//  Created by 1v1 on 2021/01/23.
//

import SwiftUI

struct SelectEmoji: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing: 10){
                ForEach(0..<10)  { index in
                    CircleView()
                        .shadow(radius: 5)
                        .foregroundColor(Color.white)
                }
            }.padding()
        }.frame(height:100)
        
       
    }
}

struct SelectEmoji_Priviews: PreviewProvider {
    static var previews: some View {
        SelectEmoji()
    }
}
