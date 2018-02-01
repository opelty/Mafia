////
////  AnimationViewController.swift
////  MAFIA
////
////  Created by Santiago Carmona Gonzalez on 1/30/18.
////  Copyright © 2018 Santiago Carmona Gonzalez. All rights reserved.
////
//
//import UIKit
//import SpriteKit
//
//class AnimationViewController: UIViewController {
//
//    private lazy var animationView = SKView()
//
//    override func loadView() {
//        super.loadView()
//        view.addSubview(animationView)
//    }
//
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//
//        // Make sure we don't recreate the scene when the view re-appears
//        guard animationView.scene == nil else {
//            return
//        }
//
//        let scene = makeScene()
//        animationView.frame.size = scene.size
//        animationView.presentScene(scene)
//    }
//
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//
//        animationView.center.x = view.bounds.midX
//        animationView.center.y = view.bounds.midY
//    }
//
////    func animateNodes(_ nodes: [SKNode]) {
////        for (index, node) in nodes.enumerated() {
////            // Offset each node with a slight delay depending on the index
////            let delayAction = SKAction.wait(forDuration: TimeInterval(index) * 0.2)
////
////            // Scale up and then back down
////            let scaleUpAction = SKAction.scale(to: 1.5, duration: 0.3)
////            let scaleDownAction = SKAction.scale(to: 1, duration: 0.3)
////
////            // Wait for 2 seconds before repeating the action
////            let waitAction = SKAction.wait(forDuration: 2)
////
////            // Form a sequence with the scale actions, as well as the wait action
////            let scaleActionSequence = SKAction.sequence([scaleUpAction, scaleDownAction, waitAction])
////
////            // Form a repeat action with the sequence
////            let repeatAction = SKAction.repeatForever(scaleActionSequence)
////
////            // Combine the delay and the repeat actions into another sequence
////            let actionSequence = SKAction.sequence([delayAction, repeatAction])
////
////            // Run the action
////            node.run(actionSequence)
////        }
////    }
//
//}
//
//extension AnimationViewController {
//    func makeScene() -> SKScene {
//        let minimumDimension = min(view.frame.width, view.frame.height)
//        let size = CGSize(width: minimumDimension, height: minimumDimension)
//
//        let scene = SKScene(size: size)
//        scene.backgroundColor = .white
//        addEmoji(to: scene)
//        animateNodes(scene.children)
//        return scene
//    }
//}
//
//
//extension SKLabelNode {
//    func renderEmoji(_ emoji: Character) {
//        fontSize = 50
//        text = String(emoji)
//
//        // This enables us to move the label using its center point
//        verticalAlignmentMode = .center
//        horizontalAlignmentMode = .center
//    }
//}
//
//extension AnimationViewController {
//    func addEmoji(to scene: SKScene) {
//        let allEmoji: [Character] = ["💣", "🔪", "🗡", "🔫"]
//        let distance = floor(scene.size.width / 4)
//
//        for (index, emoji) in allEmoji.enumerated() {
//            let node = SKLabelNode()
//            node.renderEmoji(emoji)
//            node.position.y = floor(scene.size.height / 2)
//            node.position.x = distance * (CGFloat(index) + 0.5)
//            scene.addChild(node)
//        }
//    }
//}
//
//extension AnimationViewController {
//    func animateNodes(_ nodes: [SKNode]) {
//        for (index, node) in nodes.enumerated() {
//            node.run(.sequence([
//                .wait(forDuration: TimeInterval(index) * 0.6),
//                .repeatForever(.sequence([
//                    // A group of actions get performed simultaneously
//                    .group([
//                        .sequence([
//                            .scale(to: 1.5, duration: 0.3),
//                            .scale(to: 1, duration: 0.3)
//                            ]),
//                        // Rotate by 360 degrees (pi * 2 in radians)
//                        .rotate(byAngle: .pi * 2, duration: 0.6)
//                        ]),
//                    .wait(forDuration: 2)
//                    ]))
//                ]))
//        }
//    }
//}

