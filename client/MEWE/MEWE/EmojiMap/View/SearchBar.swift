//
//  SearchBar.swift
//  MEWE
//
//  Created by Keunna Lee on 2021/02/23.
//

import SwiftUI

struct SearchBar: View {
    
    let viewModel: MapViewModel
    @State var txt = ""
    let color: Color
    let cornerRadius: CGFloat
    
    init(with viewModel: MapViewModel,
         color: Color = .softBlue,
         cornerRadius: CGFloat = 20.0) {
        self.viewModel = viewModel
        self.color = color
        self.cornerRadius = cornerRadius
    }
    
    var body: some View {
        HStack{
            Image(systemName: SystemImageName.magnifyingglass)
                .padding(.horizontal, 8)
                .foregroundColor(color)
            
            TextField("MEWE의 친구를 찾아보세요!", text: self.$txt) // should be syncronized with findingFriend viewModel
                .foregroundColor(color)
            
            Button(action: {
                withAnimation { self.txt = "" }
            }) {
                Image(systemName: SystemImageName.xmarkCircle).foregroundColor(color)
            }
            .padding(.horizontal, 8)
        }
        .background(Color.white)
        .padding(10)
        .overlay(
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(lineWidth: 2.0)
                .foregroundColor(color)
        )
        .background(RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white))
        .padding(15)
    }
}
