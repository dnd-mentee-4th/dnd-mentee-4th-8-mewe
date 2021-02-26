//
//  MonthlyRepresentativeEmojiView.swift
//  MEWE
//
//  Created by Keunna Lee on 2021/02/10.
//

import SwiftUI

struct MonthlyRepresentativeEmojiView: View {
    
    @ObservedObject var viewModel = MonthlyAnalysisViewModel()
    
    var body: some View {
        HStack {
            Image.emoji_proud
            VStack(spacing: 10) {
                Text("뿌듯")
                    .setupFont(size: 20, weight: .bold)
                HStack{
                    trendView(viewModel.analysisData.trend)
                    Text("\(viewModel.analysisData.changes)%")
                        .setupFont(size: 18, weight: .light, foregroundColor: .gray)
                }
            }
        }
    }
    
    @ViewBuilder
    private func trendView(_ trend: Trend) -> some View {
        switch trend {
        case .uptrend: Text(" ➕")
        case .downtrend: Text(" ➖")
        case .maintain: Text("-")
        }
    }
}
