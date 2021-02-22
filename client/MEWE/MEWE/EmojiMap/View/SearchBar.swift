//
//  SearchBar.swift
//  MEWE
//
//  Created by Keunna Lee on 2021/02/23.
//

import SwiftUI

struct SearchBar: View {
    @State var txt = ""
    let color: Color
    let cornerRadius: CGFloat
    
    init(color: Color = .blue, cornerRadius: CGFloat = 20.0) {
        self.color = color
        self.cornerRadius = cornerRadius
    }
    var body: some View {
        HStack{
            Image(systemName: SystemImageName.magnifyingglass).padding(.horizontal, 8)
                .foregroundColor(color)
            
            TextField("MEWE의 친구를 찾아보세요!", text: self.$txt)
                .foregroundColor(color)
            
            Button(action: {
                withAnimation { self.txt = "" }
            }) {
                Image(systemName: SystemImageName.xmarkCircle).foregroundColor(.black)
            }
            .padding(.horizontal, 8)
        }
        .padding(10)
        .overlay(
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(lineWidth: 2.0)
                .foregroundColor(color)
        )
        .padding(15)
    }
}
