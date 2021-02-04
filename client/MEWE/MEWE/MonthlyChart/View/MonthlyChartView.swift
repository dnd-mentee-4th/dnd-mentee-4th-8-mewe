//
//  MonthlyChartView.swift
//  MEWE
//
//  Created by Keunna Lee on 2021/02/03.
//

import SwiftUI
import SwiftUICharts

struct MonthlyChartView: View {
    
    @ObservedObject var viewModel = MonthlyChartViewModel()
    private let chartViewWidth: CGFloat = UIScreen.main.bounds.width - 100
    private let chartViewHeight: CGFloat = UIScreen.main.bounds.height / 3
    
    var body: some View {
        NavigationView {
            VStack {
                
                // Navigation
                HStack {
                    NavigationLink(destination: CalendarView()){
                        Image(systemName: SystemImageName.chevronLeft)
                            .font(.system(size: 25, weight:.heavy))
                            .foregroundColor(.black)
                    }
                    Text(viewModel.sceneTitle)
                        .fontWeight(.bold)
                        .font(.system(size: 30))
                }
                .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                .padding(.leading, 50)
                
                Spacer()
                
                // Select Month
                HStack {
                    
                    Button(action: { // move to previous button
                        self.viewModel.updateChartData()
                        self.viewModel.updateToPreviousMonth()
                    }, label: {
                        Image(systemName: SystemImageName.chevronLeft)
                    })
                    
                    Text("\(self.viewModel.currentYear)".trimmingCharacters(in: [","]) + "년" // remove comma
                            + " \(self.viewModel.currentMonth)월")
                    
                    Button(action: { // move to next button
                        self.viewModel.updateChartData()
                        self.viewModel.updateToNextMonth()
                    }, label: {
                        Image(systemName: SystemImageName.chevronRight)
                    })
                    
                }
                
                // Chart
                ZStack {
                    
                    // 디자인에 따라 bar chart 와 pie chart 중 하나 사용할 예정입니다
                    BarChartView(data: viewModel.barChartData, title: viewModel.sceneTitle, style: barChartStyle, form: CGSize(width: chartViewWidth, height: chartViewHeight))
                    
                    PieChartView(data: viewModel.pieChartdata, title: "월말 정산", legend: "한 달동안 어떤 감정을 느끼셨나요?", style: .init(backgroundColor: .white, accentColor: .yellow, secondGradientColor: .green, textColor: .black, legendTextColor: .gray, dropShadowColor: .black), form: CGSize(width: chartViewWidth, height: chartViewHeight), dropShadow: true, valueSpecifier: " ☺️ ")
                    
                    // notice view - not enough data
                    if viewModel.pieChartdata.count < 10 {
                        NoticeView(width: chartViewWidth, height: chartViewHeight)
                    }
                }
                Spacer()
                Spacer()
                EmptyView()
            }
            .navigationBarHidden(true)
        }
    }
}

extension MonthlyChartView {
    private var barChartStyle: ChartStyle {
        ChartStyle(backgroundColor: Color.white, accentColor: Colors.OrangeStart, secondGradientColor: Colors.OrangeEnd, textColor: Color.black, legendTextColor: Color.black, dropShadowColor: .gray )
    }
}
