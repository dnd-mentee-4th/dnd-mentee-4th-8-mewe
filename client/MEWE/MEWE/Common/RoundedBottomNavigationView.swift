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
    let height: CGFloat
    let content: Content
    let backButtonImageName: String
    let nextButtonImageName: String
    @State var active = false
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    init(
        destination: Destination,
        isRoot: Bool,
        isLast: Bool,
        color: Color = .black,
        height: CGFloat = 100,
        backButtonImageName: String = SystemImageName.arrowLeft,
        nextButtonImageName: String = SystemImageName.arrowRight,
        @ViewBuilder content: () -> Content
    ) {
        self.destination = destination
        self.isRoot = isRoot
        self.isLast = isLast
        self.color = color
        self.height = height
        self.backButtonImageName = backButtonImageName
        self.nextButtonImageName = nextButtonImageName
        self.content = content()
    }
    
    var body: some View {
        GeometryReader { geometry in
            
            ZStack {
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.white)
                    .frame(width: geometry.size.width, height: height)
                    .mask(RoundedRectangle(cornerRadius: 25, style: .continuous))
                    .shadow(color: Color(UIColor.lightGray), radius: 5, x: 0, y: 5)
                
                Spacer()
                HStack {
                    // Back Button
                    Image(systemName: backButtonImageName)
                        .frame(width: 20)
                        .foregroundColor(color)
                        .onTapGesture(count: 1, perform: {
                            self.mode.wrappedValue.dismiss()
                        }).opacity(isRoot ? 0 : 1)
                    Spacer()
                    
                    // Title
                    self.content
                    
                    // Next Button
                    Spacer()
                    Image(systemName: nextButtonImageName)
                        .frame(width: 20)
                        .foregroundColor(color)
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
                
            } //: Z
            .frame(width: geometry.size.width)
        } //: G
        .navigationBarHidden(true)
        
        .frame(height: 90)
    }
}

