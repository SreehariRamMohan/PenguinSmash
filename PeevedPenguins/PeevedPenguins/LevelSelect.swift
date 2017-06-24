//
//  LevelSelect.swift
//  PeevedPenguins
//
//  Created by Sreehari Ram Mohan on 6/23/17.
//  Copyright © 2017 Sreehari Ram Mohan. All rights reserved.
//

import Foundation
//
//  MainMenu.swift
//  PeevedPenguins
//
//  Created by Sreehari Ram Mohan on 6/21/17.
//  Copyright © 2017 Sreehari Ram Mohan. All rights reserved.
//

import Foundation


import SpriteKit

class LevelSelect: SKScene {
    
    /* UI Connections */
    
    var level1: MSButtonNode!
    var level2: MSButtonNode!
    
    override func didMove(to view: SKView) {
        /* Setup your scene here */
        
        /* Set UI connections */
        level1 = self.childNode(withName: "level1") as! MSButtonNode
        level2 = self.childNode(withName: "level2") as! MSButtonNode
        
        level2.selectedHandler = {
            self.loadGame(level: 2)
        }
        
        level1.selectedHandler = {
            self.loadGame(level: 1)
        }
        
    }
    
    func loadGame(level: Int) {
        /* 1) Grab reference to our SpriteKit view */
        guard let skView = self.view as SKView! else {
            print("Could not get Skview")
            return
        }
        
        /* Load Game scene */
        guard let scene = GameScene.level(level) else {
            print("Could not load GameScene with level 1")
            return
        }
        
        /* 3) Ensure correct aspect mode */
        scene.scaleMode = .aspectFit
        
        /* Show debug */
        skView.showsPhysics = true
        skView.showsDrawCount = true
        skView.showsFPS = true
        
        /* 4) Start game scene */
        skView.presentScene(scene)
    }
    
    
    
}
