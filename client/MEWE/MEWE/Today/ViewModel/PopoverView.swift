//
//  PopoverView.swift
//  MEWE
//
//  Created by 1v1 on 2021/01/30.
//

import SwiftUI

struct PopoverView: View {
    var body: some View {
        ZStack{
            VStack{
                Button(action:{}){
                    Image(systemName: "map")
                        .font(.system(size: 25, weight:.heavy))
                        .foregroundColor(.black)
                }
                Button(action:{}){
                    Image(systemName: "calendar")
                        .font(.system(size: 25, weight:.heavy))
                        .foregroundColor(.black)
                }
            }
            .background(Color.white)
        }
        
    }
}

struct PopoverView_Previews: PreviewProvider {
    static var previews: some View {
        PopoverView()
    }
}
