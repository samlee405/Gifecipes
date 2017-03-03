//
//  Gif.swift
//  Gifecipes
//
//  Created by Sam Lee on 3/2/17.
//  Copyright © 2017 Sam Lee. All rights reserved.
//

import Foundation
import UIKit

class Gif {
    
    let name: String
    let id: String
    let url: String
    
    let height: Int
    let width: Int
    
    var thumbnail: UIImage?
    var file: GifView?
    
    init(name: String, id: String, url: String, height: Int, width: Int) {
        self.name = name
        self.id = id
        self.url = url
        print(height)
        print(width)
        print("")
        self.height = height
        self.width = width
    }
}
