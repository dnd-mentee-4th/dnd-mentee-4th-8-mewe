//
//  CircleView.swift
//  MEWE
//
//  Created by 1v1 on 2021/01/23.
//

import SwiftUI
var vm = CircleViewModel()
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
