//
//  TodayEmojiView.swift
//  MEWE
//
//  Created by 1v1 on 2021/01/23.
//

import SwiftUI
import SpriteKit

class EmojiScene: SKScene{
    override func didMove(to view: SKView) {
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {return}
        let location = touch.location(in: self)
        let emojiImages = UIImage(named: "RecordEmoji_nextBtn")
        let texture = SKTexture(image: emojiImages!)
        let circle = SKSpriteNode(imageNamed: "RecordEmoji_nextBtn")
        circle.position = location
        circle.physicsBody = SKPhysicsBody(circleOfRadius: 15)
        addChild(circle)
    }
}

struct TodayEmojiView: View {
    @State var isSharedOn = true
    var scene: SKScene{
        let scene = EmojiScene()
        scene.size = CGSize(width: 311, height: 372)
        scene.scaleMode = .fill
        scene.backgroundColor = .white
        return scene
    }
    var body: some View {
        VStack(){
            Toggle(isOn: $isSharedOn){
            }
            .padding()
            SpriteView(scene: scene)
                .frame(width: 311, height: 372)
                .shadow(color: .gray, radius: 10, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 8)
                .foregroundColor(Color.white)
            
        }
        .padding()
    }
    
}

struct TodayEmoji_Previews: PreviewProvider {
    static var previews: some View {
        TodayEmojiView()
    }
}
