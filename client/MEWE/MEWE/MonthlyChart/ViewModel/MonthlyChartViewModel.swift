//
//  MonthlyChartViewModel.swift
//  MEWE
//
//  Created by Keunna Lee on 2021/02/03.
//

import Foundation

class MonthlyChartViewModel: ObservableObject {
    
    private let january: Int = 1
    private let december: Int = 12
    @Published var data: [Double] =  [8,23,54,32,12,37,7,23,43]
    @Published var currentMonth: Int = 0
    @Published var currentYear: Int = 0
    
    init() {
        setCurrentDate()
    }
}
// MARK: - ChartData
extension MonthlyChartViewModel {
    func updateChartData() {
        self.data = data.shuffled() // 추후 네트워크 연결 후 서버에서 받아온 데이터를 사용하여 수정할 예정입니다.
    }
}

// MARK: - Date
extension MonthlyChartViewModel {
    func setCurrentDate() {
        let date = Date()
        let calendar = Calendar.current
        var currentDate = calendar.dateComponents([.year, .month], from: date)
        updateCurrentDate(currentDate)
    }
    
    func updateToPreviousMonth() {
        if self.currentMonth == january {
            self.currentMonth = 12
            self.currentYear -= 1
        } else {
            self.currentMonth -= 1
        }
    }
    
    func updateToNextMonth() {
        if self.currentMonth == december {
            self.currentMonth = 1
            self.currentYear += 1
        } else {
            self.currentMonth += 1
        }
    }
    
    private func updateCurrentDate(_ date: DateComponents) {
        self.currentYear = Int(date.year!)
        self.currentMonth = Int(date.month!)
    }
}
