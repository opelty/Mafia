//
//  MafiaTitleAnimation.swift
//  MAFIA
//
//  Created by Santiago Carmona Gonzalez on 2/1/18.
//  Copyright © 2018 Santiago Carmona Gonzalez. All rights reserved.
//

import UIKit
import SpriteKit

class MafiaTitleAnimation: UIView {

    // MARK: - Vars & Constants
    @IBOutlet weak var animationView: SKView!

    // MARK: - Life cycle

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setup() {
        let view = Bundle.main.loadNibNamed("MafiaTitleAnimation", owner: self, options: nil)?[0] as! UIView
        view.frame = self.bounds
        
        guard animationView.scene == nil else {
            return
        }

        let scene = makeScene(view: view)
        animationView.presentScene(scene)

//        animationView.center.x = view.bounds.midX
//        animationView.center.y = view.bounds.midY
        self.addSubview(view)
    }

    func makeScene(view: UIView) -> SKScene {
        let size = CGSize(width: view.bounds.width, height: view.bounds.height)

        let scene = SKScene(size: size)
        scene.backgroundColor = Utils.Palette.Basic.darkBlue
        addEmoji(to: scene)
        animateNodes(scene.children.filter { $0.name != "LETTER"} )
        return scene
    }

    func addEmoji(to scene: SKScene) {
        let allEmoji: [Character] = ["💣", "🔪", "🔥", "🔫", "👨🏼‍✈️"]
        let mafia: [Character] = ["M", "A", "F", "I", "A"]
        let distance = floor(scene.size.width / CGFloat(allEmoji.count))

        for (index, word) in zip(mafia, allEmoji).enumerated() {

            let nodeLetter = SKLabelNode()
            nodeLetter.text = String(word.0)
            nodeLetter.fontSize = 26
            nodeLetter.fontColor = .white
            nodeLetter.verticalAlignmentMode = .center
            nodeLetter.horizontalAlignmentMode = .center
            nodeLetter.position.y = 40
            nodeLetter.position.x = distance * (CGFloat(index) + 0.5)
            nodeLetter.name = "LETTER"
            scene.addChild(nodeLetter)

            let nodeEmoji = SKLabelNode()
            nodeEmoji.renderEmoji(word.1)
            nodeEmoji.position.y = 15
            nodeEmoji.position.x = distance * (CGFloat(index) + 0.5)
            scene.addChild(nodeEmoji)
        }
    }

    func animateNodes(_ nodes: [SKNode]) {
        for (index, node) in nodes.enumerated() {
            node.run(.sequence([
                .wait(forDuration: TimeInterval(index) * 0.6),
                .repeatForever(.sequence([
                    // A group of actions get performed simultaneously
                    .group([
                        .sequence([
                            .scale(to: 1.5, duration: 0.3),
                            .scale(to: 1, duration: 0.3)
                            ]),
                        // Rotate by 360 degrees (pi * 2 in radians)
//                        .rotate(byAngle: .pi * 2, duration: 0.6)
                        ]),
                    .wait(forDuration: 2.4)
                    ]))
                ]))
        }
    }

}

extension SKLabelNode {
    func renderEmoji(_ emoji: Character) {
        fontSize = 15
        text = String(emoji)

        // This enables us to move the label using its center point
        verticalAlignmentMode = .center
        horizontalAlignmentMode = .center
    }
}
