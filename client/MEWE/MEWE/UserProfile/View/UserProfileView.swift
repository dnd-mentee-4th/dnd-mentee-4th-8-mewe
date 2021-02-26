//
//  UserProfileView.swift
//  MEWE
//
//  Created by 1v1 on 2021/01/26.
//

import SwiftUI

struct UserProfileView: View {
    var body: some View {
        RoundedBottomNavigationView(destination: CategoryView(), isRoot: false, isLast: true, height: 100) {
            Text("나의 정보")
        }
        .edgesIgnoringSafeArea(.top)

        List{
            Text("별명 수정").foregroundColor(Color.black).padding()
            Text("서비스 이용 약관").foregroundColor(Color.black).padding()
            Text("개인정보처리방침").foregroundColor(Color.black).padding()
            Text("로그아웃").foregroundColor(Color.black).padding()
        }
    }
}
