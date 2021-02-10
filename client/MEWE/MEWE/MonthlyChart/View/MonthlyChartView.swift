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
    
    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                VStack {
                    
                    // MARK: - Navigation
                    HStack {
                        NavigationLink(destination: CalendarView()){
                            Image(systemName: SystemImageName.chevronLeft)
                                .setupFont(size: 25,
                                           weight: .heavy,
                                           foregroundColor: .black)
                        }
                        Text(viewModel.sceneTitle)
                            .setupFont(size: 30,
                                       weight: .bold,
                                       foregroundColor: .black)
                    }
                    .frame(width: geometry.size.width, alignment: .leading)
                    .padding(.leading, 50)
                    
                    Spacer()
                    
                    // MARK: - Select Month
                    HStack {
                        
                        Button(action: { // move to previous buttonUIScreen
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
                    VStack {
                    // MARK: - Chart
                    ZStack {
                        
                        LineView(data: viewModel.lineChartdata, title: viewModel.sceneTitle, legend: "이번 달 감정 변화를 확인하세요 👀")
                            .padding(10)
                        
                        // notice view - not enough data
                        if viewModel.lineChartdata.count < 10 {
                            NoticeView(width: geometry.size.width - 100, height: geometry.size.height / 3)
                                .cornerRadius(30)
                        }
                    }
                    
                    // MARK: - monthly representative emoji
                    MonthlyRepresentativeEmojiView()
                        .frame(width: geometry.size.width - 10, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    
                    // MARK: - monthly analysis
                    MonthlyAnalysisView()
                        .frame(width: geometry.size.width, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    
                }
                    .frame(maxHeight: .infinity)
                }
                .navigationBarHidden(true)
            }
        }
    }
}

extension MonthlyChartView {
    private var barChartStyle: ChartStyle {
        ChartStyle(backgroundColor: Color.white,
                   accentColor: Colors.OrangeStart,
                   secondGradientColor: Colors.OrangeEnd,
                   textColor: Color.black,
                   legendTextColor: Color.black,
                   dropShadowColor: .gray )
    }
}
