//
//  MonthlyAnalysisViewModel.swift
//  MEWE
//
//  Created by Keunna Lee on 2021/02/10.
//

import Foundation

class MonthlyAnalysisViewModel: ObservableObject{
    @Published var analysisData: EmotionAnalysis =  EmotionAnalysis(description: "지난달보다 \n긍정적 감정이", changes: "4", trend: .uptrend)
}
