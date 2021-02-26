//
//  RecordEmojiView.swift
//  MEWE
//
//  Created by 1v1 on 2021/01/23.
//

import SwiftUI
import PartialSheet

struct RecordEmojiView: View {
    
    let recordEmojiViewModel = RecordEmojiViewModel()
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    @Environment(\.presentationMode) private var presentaionMode
    @EnvironmentObject private var manager: PartialSheetManager
    
    @State var selection: Bool? = false
    @State var selectedItems: Int!
    
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                VStack {
                    Text("오늘의 대표 감정은?")
                        .font(.title)
                    
                    Text("오늘의 내 기분을 대표하는 감정으로 하루를 기록해 봐요!")
                        .font(.subheadline)
                    Spacer()
                    
                    GeometryReader { scrollGeo in
                        ScrollView(showsIndicators: false) {
                            LazyVGrid(columns: columns) {
                                let numOfEmojis = RecordEmojiCell.col * RecordEmojiCell.row
                                ForEach(0..<numOfEmojis, id: \.self) { index in
                                    RecordEmojiCell(index: index)
                                }
                            } //: V
                        } //: S
                        .frame(width: scrollGeo.size.width, height: scrollGeo.size.height)
                    } //: G
                    Spacer(minLength: 0)
                } //: V
                .frame(width: geo.size.width, height: geo.size.height)
            } //: G
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: leadingNavBtn(), trailing: traillingNavBtn())
        } //: N
    }
    
    /// Leading nav button
    private func leadingNavBtn() -> some View {
        return LeadingNavView {
            closePartialSheet()
        }
    }
    
    /// Close PartialSheet
    private func closePartialSheet() {
        DispatchQueue.main.async {
            withAnimation {
                manager.closePartialSheet()
            }
        }
    }
    
    /// Trailling nav button
    private func traillingNavBtn() -> some View {
        return NavigationLink(
            destination: RecordEmojiWhereView()
        ){
            Image("RecordEmoji_nextBtn")
                .font(.system(size: 25, weight:.heavy))
                .foregroundColor(.black)
        }
    }
    
}
struct LeadingNavView: View {
    
    private let action: (() -> Void)?
    init(action: (() -> Void)? = nil) {
        self.action = action
    }
    var body: some View {
        Button(action: {
            action?()
        }, label: {
            Image("RecordEmoji_exitBtn")
                .font(.system(size: 25, weight:.heavy))
                .foregroundColor(.black)
        })
    }
}
struct TrailingNavViewForEmoji: View {
    var body: some View {
        NavigationLink(
            destination: RecordEmojiWhereView()){
            Image("RecordEmoji_nextBtn")
        }
    }

}

struct RecordEmojiView_Previews: PreviewProvider {
    static var previews: some View {
        RecordEmojiView()
            .environmentObject(PartialSheetManager())
    }
}
