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
    
    var countDown = 1
    var stopEverything = true
    
//    let tapRec = UITapGestureRecognizer()
    
    override func didMove(to view: SKView) {
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
//        turtle.position = CGPoint(x: CGRect.MidX(self.frame), y: -500)
        setUp()
//        turtle = self.childNode(withName: "Turtle") as! SKSpriteNode

        
        
        Timer.scheduledTimer(timeInterval: TimeInterval(1), target: self, selector: #selector(GameScene.createRoadStripLeft), userInfo: nil, repeats: true)
        Timer.scheduledTimer(timeInterval: TimeInterval(1), target: self, selector: #selector(GameScene.createRoadStripRight), userInfo: nil, repeats: true)
         Timer.scheduledTimer(timeInterval: TimeInterval(1), target: self, selector: #selector(GameScene.startCountDown), userInfo: nil, repeats: true)
      
        
//        tapRec.addTarget(self, action: #selector(GameScene.tappedView(_:)))
//        tapRec.numberOfTouchesRequired = 1
//        tapRec.numberOfTapsRequired = 1
//        self.view!.addGestureRecognizer(tapRec)
        
//        let gesture = UITapGestureRecognizer(target: self, action: #selector(move))
//        self.turtle.gesture
        
    }
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for touch: AnyObject in touches {
//            let location = touch.location(in: self)
//
//            turtle.physicsBody?.velocity = CGVector(dx: 0,dy: 0)
//            turtle.physicsBody?.applyImpulse(CGVector(dx: 0,dy: 25))
//
//        }
//    }
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
//    }
    
    @objc func move(){
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        showRoadStrip()
//        afterCollision()
    }
    func setUp() {
        turtle = self.childNode(withName: "Turtle") as! SKSpriteNode
        panda = self.childNode(withName: "Panda") as! SKSpriteNode
    }
    @objc func createRoadStripLeft() {
        let leftRoadStrip = SKShapeNode(rectOf: CGSize(width: 30, height: 200))
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
        let rightRoadStrip = SKShapeNode(rectOf: CGSize(width: 30, height: 200))
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
    
//    func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
//        let moveTurtle = SKAction.moveTo(y: -160, duration: 0.1)
//        let moveTurtle2 = SKAction.moveTo(y: 0, duration: 0.1)
//        if turtle.position.y == -500 {
//            turtle.run(moveTurtle)
//        }
//        else if turtle.position.y == -160 {
//            turtle.run(moveTurtle2)
//        }
//        //            if ball.position.y == 380 {
//        //                ball.runAction(moveBalldown)
//        //            }
//    }
    
//    func afterCollision(){
//        let menuScene = SKScene(fileNamed: "GameMenu")!
//        menuScene.scaleMode = .aspectFill
//        view?.presentScene(menuScene, transition: SKTransition.crossFade(withDuration: TimeInterval (2)))
//    }
    
    @objc func startCountDown(){
        if countDown>0{
            if countDown<4{
                let countDownLabel = SKLabelNode()
                countDownLabel.fontName = "AvenitNext-Bold"
                countDownLabel.fontSize = 300
                countDownLabel.fontColor = SKColor.white
                countDownLabel.text = String(countDown)
                countDownLabel.position = CGPoint(x: 0, y: 0)
                countDownLabel.zPosition = 300
                countDownLabel.name = "clabel"
                countDownLabel.horizontalAlignmentMode = .center
                addChild(countDownLabel)
                
                let deadTime = DispatchTime.now() + 0.5
                DispatchQueue.main.asyncAfter(deadline: deadTime, execute: {
                    countDownLabel.removeFromParent()
                })
            }
            countDown += 1
            if countDown == 4 {
                self.stopEverything = false
            }
        }
    }
//    func touchDown(atPoint pos: CGPoint) {
//        jump()
//    }
//
//    func walk(){
//       turtle.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 500))
//    }
    
//    func tutleTapped(){
//    }
   
    
//    func jump() {
////        turtle.texture = SKTexture(imageNamed: "Turtle_jumping")
//        turtle.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 500))
//    }
    
//    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
//    }

//    func touchUp(atPoint pos: CGPoint) {
//        turtle.texture = SKTexture(imageNamed: "turtle_standing")
//    }
  
//    @objc func tappedView(_ sender:UITapGestureRecognizer){
//        let point:CGPoint = sender.location(in: self.view)
//        print("Single Tap")
//        print(point)
//    }
    
    

}
