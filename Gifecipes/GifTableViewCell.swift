//
//  GifTableViewCell.swift
//  Gifecipes
//
//  Created by Sam Lee on 3/2/17.
//  Copyright © 2017 Sam Lee. All rights reserved.
//

import UIKit

class GifTableViewCell: UITableViewCell {
    
    @IBOutlet weak var gifImageView: GifView!
    
    var gif: Gif?
}

// MARK: - UI updates
extension GifTableViewCell {
//    func updateImageViewSize() {
//        if let unwrappedGif = gif {
//            let heightRatio = (unwrappedGif.height / unwrappedGif.width)
//            gifImageView.frame.height *= heightRatio
//        }
//    }
    
    func getThumbnail() {
        if let unwrappedGif = gif {
            NetworkingHelper.sharedInstance.getThumbnail(gif: unwrappedGif, completion: updateThumbnail)
        }
    }

    func updateThumbnail(data: Data) {
        gif!.thumbnail = UIImage(data: data)
        gifImageView.image = gif?.thumbnail
    }
}
