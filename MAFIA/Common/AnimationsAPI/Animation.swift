//
//  Animation.swift
//  MAFIA
//
//  Created by Santiago Carmona Gonzalez on 2/1/18.
//  Copyright © 2018 Santiago Carmona Gonzalez. All rights reserved.
//

import UIKit

public struct Animation {
    public let duration: TimeInterval
    public let closure: (UIView) -> Void
}

public extension Animation {
    static func fadeIn(duration: TimeInterval = 0.35) -> Animation{
        return Animation(duration: duration, closure: { $0.alpha = 1 })
    }

    static func fadeOut(duration: TimeInterval = 0.35) -> Animation{
        return Animation(duration: duration, closure: { $0.alpha = 0 })
    }

    static func resize(to size: CGSize, duration: TimeInterval = 0.35) -> Animation {
        return Animation(duration: duration, closure: { $0.bounds.size = size })
    }
}
