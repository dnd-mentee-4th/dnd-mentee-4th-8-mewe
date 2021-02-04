//
//  NoticeView.swift
//  MEWE
//
//  Created by Keunna Lee on 2021/02/04.
//

import SwiftUI

struct NoticeView: View {
    
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        
        ZStack {
            VStack() {
                Text("데이터를 \n모으는 중이에요 📊")
                    .fontWeight(.bold)
                    .font(.system(size: 25))
                    .multilineTextAlignment(.center)
        
                Text("MEWE를 한 달 이상 사용시 \n감정 월말정산을 확인할 수 있어요!")
                    .fontWeight(.none)
                    .font(.system(size: 17))
                    .foregroundColor(Color.gray)
                    .multilineTextAlignment(.center)
                    .padding(.top, 15)
            }
        }
        .padding()
        .frame(width: width, height: height)
        .background(Color.white)
        .opacity(0.8)
    }
    
}
