//
//  RoundedBottomNavigationView.swift
//  MEWE
//
//  Created by Keunna Lee on 2021/02/22.
//

import SwiftUI

struct RoundedBottomNavigationView<Content: View, Destination : View>: View {
    let destination : Destination
    let isRoot : Bool
    let isLast : Bool
    let color : Color
    let content: Content
    @State var active = false
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    init(destination: Destination,
         isRoot : Bool,
         isLast : Bool,
         color : Color,
         @ViewBuilder titleContent: () -> Content) {
        self.destination = destination
        self.isRoot = isRoot
        self.isLast = isLast
        self.color = color
        self.content = titleContent()
    }
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                Color.white
                VStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 25, style: .continuous)
                                        .fill(Color.white)
                            .frame(width: geometry.size.width, height: 100)
                            .mask(RoundedRectangle(cornerRadius: 25, style: .continuous))
                            .shadow(color: Color(UIColor.lightGray), radius: 5, x: 0, y: 5)
                                .edgesIgnoringSafeArea(.top)
                        Spacer()
                        HStack {
                            // Back Button
                            Image(systemName: SystemImageName.arrowLeft)
                                    .frame(width: 20)
                                    .foregroundColor(.black)
                                .onTapGesture(count: 1, perform: {
                                    self.mode.wrappedValue.dismiss()
                                }).opacity(isRoot ? 0 : 1)
                            Spacer()
                            
                            // Title
                            self.content
                            
                            // Next Button
                            Spacer()
                            Image(systemName: SystemImageName.arrowRight)
                                .frame(width: 20)
                                .foregroundColor(.black)
                                .onTapGesture(count: 1, perform: {
                                    self.active.toggle()
                                })
                                .opacity(isLast ? 0 : 1)
                            
                            NavigationLink(
                                destination: destination.navigationBarHidden(true)
                                    .navigationBarHidden(true),
                                isActive: self.$active,
                                label: {
                                    //no label
                                })
                        }
                        .padding([.leading,.trailing], 15)
                        .padding(.top, 50)
                        .frame(width: geometry.size.width)
                        .font(.system(size: 22))

                    }
                    .frame(width: geometry.size.width, height: 90)
                    .edgesIgnoringSafeArea(.top)
                }
            }.navigationBarHidden(true)
        }
    }
}

