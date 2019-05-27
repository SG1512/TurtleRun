//
//  GameScene.swift
//  Test1
//
//  Created by Steven Gunawan on 16/05/19.
//  Copyright © 2019 Steven Gunawan. All rights reserved.
//

import SpriteKit
import GameplayKit
import AVFoundation

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var panda = SKSpriteNode()
    var turtle = SKSpriteNode()
    var finishingLine = SKSpriteNode()
    var countDown = 1
    var stopEverything = true
    var backgroundMusic: SKAudioNode!
    
    
    override func didMove(to view: SKView) {
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        setUp()
        
        physicsWorld.contactDelegate = self
        Timer.scheduledTimer(timeInterval: TimeInterval(5), target: self, selector: #selector(GameScene.createRoadStripLeft), userInfo: nil, repeats: true)
        Timer.scheduledTimer(timeInterval: TimeInterval(5), target: self, selector: #selector(GameScene.createRoadStripRight), userInfo: nil, repeats: true)
         Timer.scheduledTimer(timeInterval: TimeInterval(1), target: self, selector: #selector(GameScene.startCountDown), userInfo: nil, repeats: true)
        
        if let musicURL =  Bundle.main.url(forResource: "race2", withExtension: "mp3"){
            backgroundMusic = SKAudioNode(url: musicURL)
            addChild(backgroundMusic)
        }
    }

    
    override func update(_ currentTime: TimeInterval) {
        showRoadStrip()
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        var firstBody = SKPhysicsBody()
        var secondBody = SKPhysicsBody()
        
        if contact.bodyA.node?.name == "Turtle" || contact.bodyA.node?.name == "Panda"{
            firstBody = contact.bodyA
            secondBody = contact.bodyB
        }else{
            firstBody = contact.bodyB
            secondBody = contact.bodyA
        }
        firstBody.node?.removeFromParent()
        afterFinishingLine()
    }
    
    func setUp() {
        turtle = self.childNode(withName: "Turtle") as! SKSpriteNode
        panda = self.childNode(withName: "Panda") as! SKSpriteNode
        finishingLine = self.childNode(withName: "finishingLine") as! SKSpriteNode
        
        turtle.physicsBody?.categoryBitMask = FinishType.ANIMAL_COLLIDER
        turtle.physicsBody?.contactTestBitMask = FinishType.FINISHLINE_COLLIDER
        turtle.physicsBody?.collisionBitMask = 0
        
        panda.physicsBody?.categoryBitMask = FinishType.ANIMAL_COLLIDER
        panda.physicsBody?.contactTestBitMask = FinishType.FINISHLINE_COLLIDER
        panda.physicsBody?.collisionBitMask = 0
        
        
        
        finishingLine.physicsBody?.categoryBitMask = FinishType.FINISHLINE_COLLIDER
        finishingLine.physicsBody?.collisionBitMask = 0
        finishingLine.physicsBody?.affectedByGravity = false

    }
    @objc func createRoadStripLeft() {
        let leftRoadStrip = SKShapeNode(rectOf: CGSize(width: 30, height: 200))
        leftRoadStrip.strokeColor = SKColor.white
        leftRoadStrip.fillColor = SKColor.white
        leftRoadStrip.alpha = 1.0
        leftRoadStrip.name = "leftRoadStrip"
        leftRoadStrip.zPosition = 0
        leftRoadStrip.position.x = -187.5
        leftRoadStrip.position.y = 700
        addChild(leftRoadStrip)
    }
    
    @objc func createRoadStripRight(){
        let rightRoadStrip = SKShapeNode(rectOf: CGSize(width: 30, height: 200))
        rightRoadStrip.strokeColor = SKColor.white
        rightRoadStrip.fillColor = SKColor.white
        rightRoadStrip.alpha = 1.0
        rightRoadStrip.name = "rightRoadStrip"
        rightRoadStrip.zPosition = 0
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
    
    func moveTurtle() {
        if !stopEverything{
        let moveAction: SKAction = SKAction.moveBy(x: 0, y: 4, duration: 1)
        turtle.run(moveAction)
        print(turtle.position)
        }
    }
    
    func movePanda() {
        if !stopEverything{
        let moveAction: SKAction = SKAction.moveBy(x: 0, y: 4, duration: 1)
        panda.run(moveAction)
        }
    }
    
    func touchDown(atPoint pos: CGPoint){
        if (pos.y < 640) && (pos.x < 0){
            moveTurtle()
        } else if (pos.y < 640) && (pos.x > 0){
            movePanda()
        }
        else {
            ()
        }
    }

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            for t in touches { self.touchDown(atPoint: t.location(in: self)) }
                }
    
    
    
    func afterFinishingLine(){
        let menuScene = SKScene(fileNamed: "GameMenu")!
        menuScene.scaleMode = .aspectFill
        view?.presentScene(menuScene, transition: SKTransition.doorsCloseHorizontal(withDuration: TimeInterval (1)))
    }
    
    
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
                MusicPlayer.shared.playSoundEffect(soundEffect: "")

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

    
    

}
