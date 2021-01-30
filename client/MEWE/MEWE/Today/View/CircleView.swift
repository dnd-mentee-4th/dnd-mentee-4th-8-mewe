//
//  CircleView.swift
//  MEWE
//
//  Created by 1v1 on 2021/01/23.
//

import SwiftUI

struct CircleView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing: 10){
                ForEach(0..<10)  { index in
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/){
                        Circle()
                            .fill(Color.orange)
                            .frame(width: 70, height: 70)
                    }
                    .shadow(radius: 5)
                    .foregroundColor(Color.white)
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
