//
//  EmojiMapView.swift
//  MEWE
//
//  Created by Keunna Lee on 2021/02/22.
//

import SwiftUI
import PartialSheet

struct EmojiMapView: View {
    
    @EnvironmentObject var partialSheetManager : PartialSheetManager
    @State var isSheetShown = false
    
    var body: some View {
        
        VStack {
            GeometryReader { geometry in
                
                // Navigation Bar
                RoundedBottomNavigationView(destination: TodayView(),
                                            isRoot: false,
                                            isLast: true) {
                    HStack {
                        Text("18 April 2019")
                            .setupFont(size: 15, weight: .regular)
                        Image(systemName:SystemImageName.chevronDown)
                            .resizable()
                            .frame(width: 15.0, height: 10.0)
                    }
                    .onTapGesture {
                        self.isSheetShown = true
                    }
                    
                }
                
                // Search Bar
                SearchBar()
                    .padding(.top, geometry.safeAreaInsets.top)
                Spacer()
                
                // Map View
                Text("Map View will be here")
                    .partialSheet(isPresented: $isSheetShown) {
                        Text("This is Calendar Sheet")
                    }
                    .addPartialSheet(style: .init(background: .solid(.white), handlerBarColor: .black, enableCover: true, coverColor: Color.black.opacity(0.5), blurEffectStyle: .regular, cornerRadius: 20, minTopDistance: geometry.size.height / 2))
            }
        }
    }
}
