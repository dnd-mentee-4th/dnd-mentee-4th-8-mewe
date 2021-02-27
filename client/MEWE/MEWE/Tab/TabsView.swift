//
//  TabView.swift
//  MEWE
//
//  Created by 1v1 on 2021/02/16.
//

import SwiftUI
import PartialSheet
let sheetManager: PartialSheetManager = PartialSheetManager()

struct TabsView: View {
    @State private var selection = 2
    var body: some View {
        TabView(selection: $selection) {
            CalendarView()
                .tabItem {
                    Image("Tabs1")
                    Text("감정 달력")
                }
            TodayView()
                .environmentObject(sheetManager)
                .tabItem {
                    Image("Tabs2")
                    Text("감정 기록")
                }
            EmojiMapView()
                .environmentObject(sheetManager)
                .tabItem {
                    Image("Tabs3")
                    Text("감정 지도")
                }
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabsView()
            .environmentObject(sheetManager)
    }
}
