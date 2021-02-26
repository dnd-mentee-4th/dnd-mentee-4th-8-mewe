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
    @State var showingNoticeView = true
    
    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                VStack {
                    
                    // MARK: - Navigation
                    RoundedBottomNavigationView(destination: CategoryView(), isRoot: false, isLast: true, height: 100) {
                        Text("월말정산")
                            .setupFont(size: 17, weight: .bold)
                    }
                    .edgesIgnoringSafeArea(.top)
                    
                    Spacer()
                    
                    // MARK: - Select Month
                    selectMonth()
                    
                    VStack {
                        // MARK: - Chart
                        ZStack {
                            VStack {
                                LineView(data: viewModel.lineChartdata, title: "", legend: "이번 달 감정 변화를 확인하세요 👀")
                                    .padding(10)
                            }
                            
                            VStack(spacing: 10) {
                                
                                // notice view - not enough data
                                if showingNoticeView {
                                    NoticeView(isPresented: self.$showingNoticeView, width: geometry.size.width - 50, height: geometry.size.height / 2.5)
                                        .cornerRadius(30)
                                    representativeEmoji(in: geometry)
                                } else {
                                    representativeEmoji(in: geometry)
                                        .padding(.top, 250)
                                }
                                
                            }
                        }
                    }
                }
                .foregroundColor(.greyWhite)
                .navigationBarHidden(true)
            }
        }
    }
}

extension MonthlyChartView {
    @ViewBuilder
    private func selectMonth() -> some View {
        HStack {
            
            Button(action: { // move to previous buttonUIScreen
                self.viewModel.updateChartData()
                self.viewModel.updateToPreviousMonth()
            }, label: {
                Image(systemName: SystemImageName.chevronLeft)
                    .foregroundColor(.black)
            })
            
            Text("   \(self.viewModel.currentYear)".trimmingCharacters(in: [","]) + "년" // remove comma
                    + " \(self.viewModel.currentMonth)월   ")
                .foregroundColor(.black)
            
            Button(action: { // move to next button
                self.viewModel.updateChartData()
                self.viewModel.updateToNextMonth()
            }, label: {
                Image(systemName: SystemImageName.chevronRight)
                    .foregroundColor(.black)
            })
            
        }
    }
    
    @ViewBuilder
    private func representativeEmoji(in geometry: GeometryProxy) -> some View {
        VStack(spacing: 30){
            Divider()
            
            // representative emoji of this month
            Text("이달의 대표 감정")
                .foregroundColor(.black)
            MonthlyRepresentativeEmojiView()
                .frame(width: geometry.size.width - 10, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        }
    }
}
