//
//  DetailPlayerViewController.swift
//  MAFIA
//
//  Created by Luis Ramirez on 1/15/18.
//  Copyright © 2018 Santiago Carmona Gonzalez. All rights reserved.
//

import UIKit

class DetailPlayerViewController: UIViewController {
    
    @IBOutlet weak var namePlayer: UILabel!
    @IBOutlet weak var imageRole: UIImageView!
    @IBOutlet weak var roleName: UILabel!
    
    weak var player: PlayerMO?
    weak var previousViewController: GameViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let playerUnwrapped = player {
            namePlayer.text = playerUnwrapped.name
            imageRole.image = UIImage(named: "\(playerUnwrapped.role.imageDescription)")
            roleName.text = playerUnwrapped.role.roleDescription
        }
    }

    
    func goBack() {
        let gameViewController = previousViewController
        self.navigationController?.popToViewController(gameViewController!, animated: true)
    }

    @IBAction func goBackToGame(_ sender: Any) {
        self.goBack()
    }
    
}
