//
//  DetailPlayerViewController.swift
//  MAFIA
//
//  Created by Luis Ramirez on 1/15/18.
//  Copyright © 2018 Santiago Carmona Gonzalez. All rights reserved.
//

import UIKit

class DetailPlayerViewController: UIViewController {
    
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var roleImage: UIImageView!
    
    weak var player: PlayerMO?
    weak var previousViewController: GameViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let playerUnwrapped = player else { return }
        setupView(player: playerUnwrapped)
    }

    func setupView(player: PlayerMO) {
        self.playerName.text = player.name
        self.roleImage.image = UIImage(named: "\(player.role.imageDescription)")
    }
    
    func goBack() {
        let gameViewController = previousViewController
        self.navigationController?.popToViewController(gameViewController!, animated: true)
    }

    @IBAction func goBackToGame(_ sender: Any) {
        self.goBack()
    }
    
}
