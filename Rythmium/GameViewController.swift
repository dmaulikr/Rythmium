//
//  GameViewController.swift
//  UntitledMusicGame
//
//  Created by 舒润萱 on 15/7/7.
//  Copyright (c) 2015年 舒润萱. All rights reserved.
//

import UIKit
import SpriteKit

// 表示游戏阶段的枚举
enum GameStage {
    case StartUp, Setting, Analyze, Game, Result
}
// 表示可视化类型的枚举
enum visualization {
    case Spectrum, None
}
// 全局变量
var Stage = GameStage.StartUp                       // 游戏阶段
var Scene: SKScene = SKScene()                      // 场景
var exporter: MediaLibExport = MediaLibExport()     // 音乐导出
var width: CGFloat = 0                              // 场景宽度
var height: CGFloat = 0                             // 场景高度
var ratio: CGFloat = 1                              // 与iPhone 6 Plus的比例
let staticNodesAppearAction = SKAction.fadeAlphaTo(1, duration: 0.5)
let staticNodesDisappearAction = SKAction.sequence([SKAction.fadeAlphaTo(0, duration: 0.5), SKAction.removeFromParent()])
var background = SKSpriteNode()

var backgrounds = [SKSpriteNode(texture: SKTexture(imageNamed: "Background1")), SKSpriteNode(texture: SKTexture(imageNamed: "Background2")), SKSpriteNode(texture: SKTexture(imageNamed: "Background3")), SKSpriteNode(texture: SKTexture(imageNamed: "Background4")), SKSpriteNode(texture: SKTexture(imageNamed: "Background5"))]

var score: Int = 0
var totalScore: Int = 0
var combo: Int = 0
var maxCombo: Int = 0
var fullCombo = true
var differentJudges = [0, 0, 0, 0, 0]

var visualizationType = visualization.Spectrum

var View = SKView()

var artViewBackground: MPMediaItemArtwork?

var Left = [Double]()

class GameViewController: UIViewController {

    override func viewDidLoad() {
       
        super.viewDidLoad()
        
        // 使exporter显示
        self.addChildViewController(exporter)
        
        // Configure the view.
        let skView = self.view as! SKView
        View = skView
        /* Sprite Kit applies additional optimizations to improve rendering performance */
        skView.ignoresSiblingOrder = true
        
        Scene = StartUpScene(size : skView.bounds.size) // 从StartUpScene启动
        
        // 读取屏幕大小
        width = Scene.frame.width
        height = Scene.frame.height
        ratio = width / 736.0
        
        // 设置背景
        for child in backgrounds {
            child.size = CGSizeMake(width, height)
            child.position = CGPointMake(width / 2, height / 2)
            child.zPosition = -1000
        }
        
        /* Set the scale mode to scale to fit the window */
        Scene.scaleMode = .AspectFill
        
        //skView.showsFPS = true
        //skView.showsDrawCount = true
        //skView.showsFields = true
        //skView.showsNodeCount = true
        //skView.showsQuadCount = true
        //skView.shouldCullNonVisibleNodes = true
        
        skView.presentScene(Scene)
        
        

    }
    

    override func shouldAutorotate() -> Bool {
        return true
    }

    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return .AllButUpsideDown
        } else {
            return .All
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}