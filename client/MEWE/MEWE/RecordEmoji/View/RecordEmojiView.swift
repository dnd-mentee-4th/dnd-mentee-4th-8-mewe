//
//  RecordEmojiView.swift
//  MEWE
//
//  Created by 1v1 on 2021/01/23.
//

import SwiftUI
import PartialSheet

struct RecordEmojiView: View {
    @State var selection: Bool? = false
    @State var selectedItems: Int!
    @EnvironmentObject var partialSheet : PartialSheetManager
    let recordEmojiViewModel = RecordEmojiViewModel()
    
    var body: some View {
        NavigationView{
            VStack {
                Text("오늘의 대표 감정은?")
                    .font(.title)
                Text("오늘의 내 기분을 대표하는 감정으로 하루를 기록해 봐요!")
                    .font(.subheadline)
                ScrollView(.vertical, showsIndicators: false, content: {
                    ForEach(0..<RecordEmojiCell.row){ i in
                        HStack{
                            ForEach(0..<RecordEmojiCell.col) { j in
                                RecordEmojiCell().onTapGesture {
                                    let index = j+(i*2)
                                    print("\(index)")
                                }
                            }
                        }
                    }
                })
            }
            
            .navigationBarItems(leading: LeadingNavView(), trailing: TrailingNavView())
        }
        .padding()
        .frame(height: 500)
        
    }
}
struct LeadingNavView: View {
      var body: some View {
        Button(action: {
            //dismiss....
        }, label: {
            Image("RecordEmoji_exitBtn")
                .font(.system(size: 25, weight:.heavy))
                .foregroundColor(.black)
        })
      }
    }
struct TrailingNavView: View {
    var body: some View {
        NavigationLink(
            destination: RecordEmojiWhereView()){
            Image("RecordEmoji_nextBtn")
                .font(.system(size: 25, weight:.heavy))
                .foregroundColor(.black)
        }
    }
}

extension RecordEmojiView{
    private func buttonPressed(with title: String){
        // if self.selectedTitles.
    }
}

struct RecordEmojiView_Previews: PreviewProvider {
    static var previews: some View {
        RecordEmojiView()
            .environmentObject(PartialSheetManager())
    }
}
