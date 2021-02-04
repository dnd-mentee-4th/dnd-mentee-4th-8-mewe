//
//  Font.swift
//  MEWE
//
//  Created by Keunna Lee on 2021/02/04.
//

import SwiftUI

extension View {
    func setupFont(size: CGFloat, weight: Font.Weight, foregroundColor: Color = .black) -> some View {
    self.font(.system(size: size, weight: weight, design: .default))
          .foregroundColor(foregroundColor)
  }
}
