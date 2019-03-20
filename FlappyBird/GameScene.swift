//
//  GameScene.swift
//  FlappyBird
//
//  Created by Максим Лисица on 21/03/2019.
//  Copyright © 2019 Максим Лисица. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var backgroundNode: SKNode!
    var birdNode: SKSpriteNode!
    var gameOverLabel: SKLabelNode!
    var restartButton: SKLabelNode!
    override func didMove(to view: SKView) {
        
        backgroundNode = self.childNode(withName: "background")!
        birdNode = self.childNode(withName: "bird") as? SKSpriteNode
        gameOverLabel = self.childNode(withName: "GameOverLabel") as! SKLabelNode
        
        gameOverLabel.alpha = 0
        
        self.physicsWorld.contactDelegate = self
        
        let moveBackground = SKAction.move(by: CGVector(dx: -5000, dy: 0), duration: 70)
        backgroundNode.run(moveBackground)
        
            
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        birdNode.physicsBody!.applyImpulse(CGVector(dx: 0, dy: 3))
    }
    
    
    func didBegin(_ contact: SKPhysicsContact) {
        stopGame()
    }
    func stopGame(){
        backgroundNode.removeAllActions()
        birdNode.physicsBody!.pinned = true
        
        gameOverLabel.run(SKAction.fadeIn(withDuration: 0.5))
    }
    
    
}
