//
//  GifView.swift
//  Gifecipes
//
//  Created by Sam Lee on 3/2/17.
//  Copyright © 2017 Sam Lee. All rights reserved.
//

import Foundation
import UIKit
import Gifu

class GifView: UIImageView, GIFAnimatable {
    public lazy var animator: Animator? = {
        return Animator(withDelegate: self)
    }()
    
    override public func display(_ layer: CALayer) {
        updateImageIfNeeded()
    }
}
