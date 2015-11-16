//
//  GameScene.swift
//  UntitledMusicGame
//
//  Created by 舒润萱 on 15/7/7.
//  Copyright (c) 2015年 舒润萱. All rights reserved.
//

import SpriteKit

class StartUpScene: SKScene {
    
    var titleLabel = SKLabelNode(text: "Rythmium")
    var startGameButton = SKLabelNode(text: "START GAME")
    var settingButton = SKLabelNode(text: "SETTINGS")
    var aboutButton = SKLabelNode(text: "ABOUT")
    
    var Background = SKSpriteNode()
    
    override func didMoveToView(view: SKView) {
        
        Stage = GameStage.StartUp
        
        titleLabel.fontName = "SFUIDisplay-Ultralight"
        startGameButton.fontName = "SFUIDisplay-Ultralight"
        settingButton.fontName = "SFUIDisplay-Ultralight"
        aboutButton.fontName = "SFUIDisplay-Ultralight"
        
        titleLabel.fontSize = 80 * ratio
        startGameButton.fontSize = 40 * ratio
        settingButton.fontSize = 40 * ratio
        aboutButton.fontSize = 40 * ratio
        
        titleLabel.name = "titleLabel"
        startGameButton.name = "startGameButton"
        settingButton.name = "settingButton"
        aboutButton.name = "aboutButton"
        
        titleLabel.position = CGPointMake(width / 2, height * 17 / 24 - titleLabel.frame.height / 2.0)
        settingButton.position = CGPointMake(width / 2, height / 3 - settingButton.frame.height)
        startGameButton.position = CGPointMake(width / 2, settingButton.position.y + settingButton.frame.height * 1.5)
        aboutButton.position = CGPointMake(width / 2, settingButton.position.y - settingButton.frame.height * 1.5)
        
        if background.texture == nil {
            background = backgrounds[Int(arc4random() % 5)].copy() as! SKSpriteNode
        }
        Background = background.copy() as! SKSpriteNode
        
        self.addChild(Background)
        self.addChild(titleLabel)
        self.addChild(settingButton)
        self.addChild(startGameButton)
        self.addChild(aboutButton)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
        
        for touch in touches {
            let location = touch.locationInNode(self)
            let node = self.nodeAtPoint(location)
            
            if node.name != nil {
                switch node.name!{
                case "startGameButton":
                    Scene = ChooseScene(size : CGSizeMake(width, height))
                    View.presentScene(Scene, transition: SKTransition.crossFadeWithDuration(0.5))
                case "settingButton":
                    Scene = SettingScene(size : CGSizeMake(width, height))
                    View.presentScene(Scene, transition: SKTransition.crossFadeWithDuration(0.5))
                case "aboutButton":
                    Scene = AboutScene(size : CGSizeMake(width, height))
                    View.presentScene(Scene, transition: SKTransition.crossFadeWithDuration(0.5))
                default:
                    break
                }
            }
            
            
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
