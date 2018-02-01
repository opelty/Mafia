//
//  UIViewExtension.swift
//  MAFIA
//
//  Created by Santiago Carmona Gonzalez on 2/1/18.
//  Copyright © 2018 Santiago Carmona Gonzalez. All rights reserved.
//

import UIKit

public extension UIView {

    /// Animates sequentially
    /// - parameter animations: The animations to be executed

    public func animate(_ animations: [Animation]) {
        guard !animations.isEmpty else {
            return
        }

        var animations = animations
        let animation = animations.removeFirst()

        UIView.animate(withDuration: animation.duration, animations: {
            animation.closure(self)
        }, completion: { _ in
            self.animate(animations)
        })
    }

    public func animate(inParallel animations: [Animation]) {
        for animation in animations {
            UIView.animate(withDuration: animation.duration) {
                animation.closure(self)
            }
        }
    }
}
