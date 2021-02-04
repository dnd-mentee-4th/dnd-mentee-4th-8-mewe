//
//  CategoryView.swift
//  MEWE
//
//  Created by 1v1 on 2021/01/23.
//

import SwiftUI

struct CategoryView: View {
    @State var isAlarmOn = false
    var body: some View {
        VStack{
            List{
                naviLink(UserProfileView(), "나의 정보")
                naviLink(FriendView(), "친구 목록")
                naviLink(EmptyView(), "감정 방명록")
                naviLink(EmptyView(), "월말 정산")
                Toggle(isOn: $isAlarmOn, label: {
                    VStack(alignment: .leading){
                        Text("알람 설정")
                        Text("오늘 감정 기록 하셨나요? 처럼 인사를 알람으로 보내드려요!")
                            .font(.caption)
                            .foregroundColor(Color.gray)
                            .padding([.top, .bottom, .trailing])
                            
                    }.padding()
                })
            }
        }
        
        
    }
   
}

extension CategoryView {
    func naviLink<V: View>(_ destination: V, _  text: String) -> some View{
        NavigationLink(
            destination: destination,
            label: {
                Text(text).foregroundColor(Color.black).padding()
            })
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView()
    }
}
