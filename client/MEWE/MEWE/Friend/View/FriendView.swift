//
//  FriendView.swift
//  MEWE
//
//  Created by 1v1 on 2021/01/26.
//

import SwiftUI

struct FriendView: View {
    var body: some View {
        RoundedBottomNavigationView(destination: CategoryView(), isRoot: false, isLast: true, height: 100) {
            Text("친구 목록")
        }
        .edgesIgnoringSafeArea(.top)

        List{
            Text("밥풀\ngigl@naver.com").multilineTextAlignment(.leading).padding()
            Text("chloe\nunichloe22@naver.com").multilineTextAlignment(.leading).padding()
            Text("madilyn\nhimadilyn@naver.com").multilineTextAlignment(.leading).padding()
            Text("lena\nlenaLEe@naver.com").multilineTextAlignment(.leading).padding()
        }
    }
}

struct FriendView_Previews: PreviewProvider {
    static var previews: some View {
        FriendView()
    }
}
