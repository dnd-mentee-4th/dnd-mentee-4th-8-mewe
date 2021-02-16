//
//  TabView.swift
//  MEWE
//
//  Created by 1v1 on 2021/02/16.
//

import SwiftUI

struct TabsView: View {
    @State private var selection = 1
    var body: some View {
        TabView(selection: $selection) {
            CalendarView()
                .tabItem {
                    Image(systemName: "1.square.fill")
                    Text("감정 달력")
                }
            TodayView()
                .tabItem {
                    Image(systemName: "2.square.fill")
                    Text("감정 기록")
                }
            Text("감정 지도 뷰")
                .tabItem {
                    Image(systemName: "3.square.fill")
                    Text("감정 지도")
                }
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabsView()
    }
}
