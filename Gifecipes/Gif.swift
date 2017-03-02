//
//  Gif.swift
//  Gifecipes
//
//  Created by Sam Lee on 3/2/17.
//  Copyright © 2017 Sam Lee. All rights reserved.
//

import Foundation
import UIKit

struct Gif {
    let gifURL: String
    var gifThumbnail: UIImage?
    var gifFile: GifView?
    
    init(url: String) {
        self.gifURL = url
    }
}
