//
//  TodayEmojiView.swift
//  MEWE
//
//  Created by 1v1 on 2021/01/23.
//

import SwiftUI
import SpriteKit
var vm = CircleViewModel()

struct SpriteKitContainer: UIViewRepresentable {
    
    typealias UIViewType = SKView
    
    var skScene: SKScene!
    
    init(scene: SKScene) {
        skScene = scene
        self.skScene.size = CGSize(width: 311, height: 372)
        self.skScene.scaleMode = .fill
        self.skScene.backgroundColor = .white
        
    }
    
    func makeUIView(context: Context) -> SKView {
        let view = SKView()
        
        return view
    }
    
    func updateUIView(_ view: SKView, context: Context) {
        view.presentScene(context.coordinator.scene)
    }
    
    func makeCoordinator() -> Coordinator {
        let coordinator = Coordinator()
        coordinator.scene = self.skScene
        return coordinator
    }
    
    class Coordinator: NSObject {
        var scene: SKScene?
    }
    
}
class EmojiScene: SKScene{
    override func didMove(to view: SKView) {
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
    }
    func makeCircle(screenWidth: CGFloat, screenHeight: CGFloat, index: Int) {
        
        let x = CGFloat.random(in: 0...screenWidth - 50)
        let emojiImg = UIImage(named: emojiStrings[index])
        
        let texture = SKTexture(image:emojiImg!)
        let circle = SKSpriteNode(texture: texture)
        
        circle.position = CGPoint(x: x, y: screenHeight)
        circle.physicsBody = SKPhysicsBody(circleOfRadius: 25)
        circle.size = CGSize(width: 50, height: 50)
        addChild(circle)
    }
    
}

struct TodayEmojiView: View {
    @State var isSharedOn = true
    private var scene: EmojiScene
    init(_ scene: EmojiScene = EmojiScene()) {
        self.scene = scene
    }
    var body: some View {
        VStack(){
            Toggle(isOn: $isSharedOn){
            }
            .toggleStyle(MyToggleStyle())
            .padding()
            SpriteKitContainer(scene: scene)
                .frame(width: 311, height: 372)
                .cornerRadius(25)
                .shadow(color: .gray, radius: 10, x: 0.0, y: 8)
                .foregroundColor(Color.white)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 10){
                    ForEach(0..<10)  { index in
                        Button(action: {
                            if !(vm.selectedSubEmojis.contains(index)) {
                                scene.makeCircle(screenWidth: 311, screenHeight: 372, index: index)
                                vm.choose(selected: index)
                            }
                            
                        }){
                            Image(emojiStrings[index])
                                .resizable()
                                .frame(width: 54.8, height: 54.8)
                                .clipShape(Circle())
                        }
                        .shadow(radius: 5)
                        .foregroundColor(Color.white)
                        .padding(.trailing)
                    }
                }.padding()
            }.frame(height:100)
        }
        .padding()
    }
    
}

struct TodayEmoji_Previews: PreviewProvider {
    static var previews: some View {
        TodayEmojiView()
    }
}
