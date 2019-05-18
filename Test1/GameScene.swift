//
//  GameScene.swift
//  Test1
//
//  Created by Steven Gunawan on 16/05/19.
//  Copyright © 2019 Steven Gunawan. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var panda = SKSpriteNode()
    var turtle = SKSpriteNode()
    
//    let tapRec = UITapGestureRecognizer()
    
    override func didMove(to view: SKView) {
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        setUp()
//        turtle = self.childNode(withName: "Turtle") as! SKSpriteNode

        
        
//                Timer.scheduledTimer(timeInterval: TimeInterval(1), target: self, selector: #selector(GameScene.createRoadStripLeft), userInfo: nil, repeats: true)
        Timer.scheduledTimer(timeInterval: TimeInterval(0.4), target: self, selector: #selector(GameScene.createRoadStripRight), userInfo: nil, repeats: true)
        
        
//        tapRec.addTarget(self, action: #selector(GameScene.tappedView(_:)))
//        tapRec.numberOfTouchesRequired = 1
//        tapRec.numberOfTapsRequired = 1
//        self.view!.addGestureRecognizer(tapRec)
        
//        let gesture = UITapGestureRecognizer(target: self, action: #selector(move))
//        self.turtle.gesture
        
    }
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
//    }
    
    @objc func move(){
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        showRoadStrip()
    }
    func setUp() {
        turtle = self.childNode(withName: "Turtle") as! SKSpriteNode
        panda = self.childNode(withName: "Panda") as! SKSpriteNode
    }
    @objc func createRoadStripLeft() {
        let leftRoadStrip = SKShapeNode(rectOf: CGSize(width: 30, height: 300))
        leftRoadStrip.strokeColor = SKColor.white
        leftRoadStrip.fillColor = SKColor.white
        leftRoadStrip.alpha = 0.4
        leftRoadStrip.name = "leftRoadStrip"
        leftRoadStrip.zPosition = 10
        leftRoadStrip.position.x = -187.5
        leftRoadStrip.position.y = 700
        addChild(leftRoadStrip)
    }
    
    @objc func createRoadStripRight(){
        let rightRoadStrip = SKShapeNode(rectOf: CGSize(width: 30, height: 100))
        rightRoadStrip.strokeColor = SKColor.white
        rightRoadStrip.fillColor = SKColor.white
        rightRoadStrip.alpha = 0.4
        rightRoadStrip.name = "rightRoadStrip"
        rightRoadStrip.zPosition = 10
        rightRoadStrip.position.x = 187.5
        rightRoadStrip.position.y = 700
        addChild(rightRoadStrip)
    }
    
    func showRoadStrip(){
        enumerateChildNodes(withName: "leftRoadStrip", using: { (roadStrip, stop) in
            let strip = roadStrip as! SKShapeNode
            strip.position.y -= 30
        })
        enumerateChildNodes(withName: "rightRoadStrip", using: { (roadStrip, stop) in
            let strip = roadStrip as! SKShapeNode
            strip.position.y -= 30
        })
    }
    
//    func touchDown(atPoint pos: CGPoint) {
//        walk()
//    }
//
//    func walk(){
//       turtle.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 500))
//    }
    
//    func tutleTapped(){
//    }
   
    
//    func jump() {
//        turtle.texture = SKTexture(imageNamed: "Turtle_jumping")
//        turtle.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 500))
//    }
    
//    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
//    }
//
//    func touchUp(atPoint pos: CGPoint) {
//        turtle.texture = SKTexture(imageNamed: "turtle_standing")
//    }
  
//    @objc func tappedView(_ sender:UITapGestureRecognizer){
//        let point:CGPoint = sender.location(in: self.view)
//        print("Single Tap")
//        print(point)
//    }
    
    

}
