//
//  TodayView.swift
//  MEWE
//
//  Created by 1v1 on 2021/01/23.
//

import SwiftUI
import PartialSheet


struct TodayView: View {
    @State var showPopover = false
    @EnvironmentObject var partialSheetManager : PartialSheetManager

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
                Button("담기 완료!") {
                    self.partialSheetManager.showPartialSheet({
                        print("sheet dismissed")
                    }) {
                        RecordEmojiView()
                    }
                }.padding(8)
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(40)
                .font(Font.system(size: 12))
                .position(x: 330)
                SelectEmoji()
            }
            .navigationBarHidden(true)
        }
        .addPartialSheet()
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
            .environmentObject(PartialSheetManager())
    }
}
