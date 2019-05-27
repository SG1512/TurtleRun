//
//  PandaWin.swift
//  Test1
//
//  Created by Steven Gunawan on 27/05/19.
//  Copyright © 2019 Steven Gunawan. All rights reserved.
//

import Foundation
import SpriteKit

class PandaWin: SKScene{
    
    var homeButton = SKSpriteNode()
    
    override func didMove(to view: SKView) {
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        homeButton = self.childNode(withName: "homeButton") as! SKSpriteNode
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let touchLocation = touch.location(in: self)
            if atPoint(touchLocation).name == "homeButton" {
                let gameScene = SKScene(fileNamed: "GameMenu")!
                gameScene.scaleMode = .aspectFill
                view?.presentScene(gameScene, transition: SKTransition.fade(withDuration: TimeInterval (1)))
                
            }
        }
    }
}
