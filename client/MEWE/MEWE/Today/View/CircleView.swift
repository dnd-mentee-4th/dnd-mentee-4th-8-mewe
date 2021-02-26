//
//  CircleView.swift
//  MEWE
//
//  Created by 1v1 on 2021/01/23.
//

import SwiftUI
var vm = CircleViewModel()
var emojiStrings = ["emoji_anger","emoji_concern", "emoji_ease", "emoji_flustration", "emoji_happiness", "emoji_heart", "emoji_joy", "emoji_proud", "emoji_sadness", "emoji_tiredness"]
struct CircleView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing: 10){
                ForEach(0..<10)  { index in
                    Button(action: {
                        print(index)
                        vm.choose(selected: index)
                    }){
                        Circle()
                            .fill(Color.white)
                            .frame(width: 54.8, height: 54.8)
                    }
                    .shadow(radius: 5)
                    .foregroundColor(Color.white)
                    .padding(.trailing)
                }
            }.padding()
        }.frame(height:100)
        
        
    }
}

struct CircleView_Previews: PreviewProvider {
    static var previews: some View {
        CircleView()
    }
}
