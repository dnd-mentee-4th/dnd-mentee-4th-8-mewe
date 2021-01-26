//
//  CategoryView.swift
//  MEWE
//
//  Created by 1v1 on 2021/01/23.
//

import SwiftUI

struct CategoryView: View {
    var body: some View {
        VStack{
            List{
                Text("알람 On/off")
                Text("감정 방명록")
                Text("친구 목록")
                Text("월말정산")
                Text("내 정보")
            }
        }
        
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView()
    }
}
