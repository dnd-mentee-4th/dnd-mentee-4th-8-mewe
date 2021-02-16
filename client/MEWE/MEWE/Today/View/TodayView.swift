//
//  TodayView.swift
//  MEWE
//
//  Created by 1v1 on 2021/01/23.
//

import SwiftUI

struct TodayView: View {
    @State var showPopover = false
    
    var body: some View {
        
        NavigationView{
            VStack{
                HStack(){
                    NavigationLink(
                        destination: CategoryView()){
                        Image(systemName: "line.horizontal.3.decrease")
                            .font(.system(size: 25, weight:.heavy))
                            .foregroundColor(.black)
                    }
                    Spacer(minLength: 0)
                }
                .padding()
                
                Text(dateForTodayView(date: Date()))
                TodayEmojiView()
                Button("담기 완료") {
                    // 대표 감정 선택 뷰 올라오기
                }
                Spacer(minLength: 0)
                SelectEmoji()
            }
            
            
        } .navigationBarHidden(true)
    }
    
    
}
func dateForTodayView(date: Date) -> String {
    let format = DateFormatter()
    format.dateFormat = "dd MMM yyyy"

    return format.string(from: date)
}
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        TodayView()
    }
}
