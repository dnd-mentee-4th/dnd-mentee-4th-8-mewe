//
//  CircleViewModel.swift
//  MEWE
//
//  Created by 1v1 on 2021/02/23.
//

import SwiftUI

class CircleViewModel {
    let emojis = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    var selectedSubEmojis:[Int] = []
    
    func choose(selected: Int) {
        selectedSubEmojis.append(selected)
        selectedSubEmojis = Array(Set(selectedSubEmojis))
        print("current selected emojis: ", selectedSubEmojis)
    }
}
