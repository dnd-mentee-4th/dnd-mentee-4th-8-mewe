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
    func analysisCellView(_ description: String, _  percentage: String, _ isUp: Trend) -> some View {
        VStack {
            Text(description)
                .setupFont(size: 13, weight: .light, foregroundColor: .gray)
            HStack {
                Text(percentage)
                    .setupFont(size: 15, weight: .bold)
                switch isUp {
                case .uptrend: Text("⬆️").setupFont(size: 15, weight: .bold)
                case .downtrend: Text("⬇️").setupFont(size: 15, weight: .bold)
                case .maintain: Text("−").setupFont(size: 15, weight: .bold)
                }
            }
        }
    }
}
