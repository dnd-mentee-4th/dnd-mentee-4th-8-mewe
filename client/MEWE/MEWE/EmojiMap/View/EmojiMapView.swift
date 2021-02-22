//
//  EmojiMapView.swift
//  MEWE
//
//  Created by Keunna Lee on 2021/02/22.
//

import SwiftUI

struct EmojiMapView: View {
    var body: some View {
        RoundedBottomNavigationView(destination: TodayView(),
                                    isRoot: false,
                                    isLast: true,
                                    color: .white) {
            Text("18 April 2019")
                .setupFont(size: 15, weight: .regular)
        }
    }
}
