//
//  TodayView.swift
//  MEWE
//
//  Created by 1v1 on 2021/01/23.
//

import SwiftUI

struct TodayView: View {
    @State var showPopover = false
    @State var isRecordingOn = false
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    NavigationLink(
                        destination: CategoryView()){
                        Image(systemName: "line.horizontal.3.decrease")
                            .font(.system(size: 25, weight:.heavy))
                            .foregroundColor(.black)
                    }
                    
                    Spacer(minLength: 0)
                    
                    
                }
                .padding()
                TodayEmojiView()
                    .padding()
                Spacer(minLength: 0)
                
                
                
                Button(action: {
                    withAnimation(.spring()){
                        self.isRecordingOn.toggle()
                    }
                    
                }, label: {
                    Circle()
                        .frame(width: 55, height: 55)
                        .shadow(radius: 5)
                        .foregroundColor(Color.white)
                })
                if self.isRecordingOn{
                    SelectEmoji()
                }
            }
            
            
        } .navigationBarHidden(true)
    }
    
    
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        TodayView()
    }
}
