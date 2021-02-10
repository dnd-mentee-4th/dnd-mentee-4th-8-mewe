//
//  MonthlyAnalysisView.swift
//  MEWE
//
//  Created by Keunna Lee on 2021/02/10.
//

import SwiftUI

enum Trend {
    case uptrend
    case downtrend
    case maintain
}

struct MonthlyAnalysisView: View {
    
    @ObservedObject var viewModel = MonthlyAnalysisViewModel()
    
    var body: some View {
        HStack {
            ForEach(viewModel.analysisData) { data in
                analysisCellView(data.description, data.changes, data.trend)
            }
        }
    }
}

extension MonthlyAnalysisView {
    @ViewBuilder
    private func analysisCellView(_ description: String, _  percentage: String, _ trend: Trend) -> some View {
        VStack {
            Text(description)
                .setupFont(size: 13, weight: .light, foregroundColor: .gray)
            HStack {
                Text(percentage)
                    .setupFont(size: 15, weight: .bold)
                trendView(trend)
                    .setupFont(size: 15, weight: .bold)
            }
        }
    }
    
    @ViewBuilder
    private func trendView(_ trend: Trend) -> some View {
        switch trend {
        case .uptrend: Text("⬆️")
        case .downtrend: Text("⬇️")
        case .maintain: Text("−")
        }
    }
}
