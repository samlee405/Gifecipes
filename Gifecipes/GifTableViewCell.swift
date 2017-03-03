//
//  GifTableViewCell.swift
//  Gifecipes
//
//  Created by Sam Lee on 3/2/17.
//  Copyright © 2017 Sam Lee. All rights reserved.
//

import UIKit

class GifTableViewCell: UITableViewCell {
    
    @IBOutlet weak var gifImageView: UIImageView!
    
    var gif: Gif?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

// MARK: - UI updates
extension GifTableViewCell {
    func getThumbnail() {
        if let unwrappedGif = gif {
            NetworkingHelper.sharedInstance.getThumbnail(gif: unwrappedGif, completion: updateThumbnail)
        }
    }
}

//MARK: - Networking completion handlers
extension GifTableViewCell {
    func updateThumbnail(data: Data) {
        gif!.thumbnail = UIImage(data: data)
        gifImageView.image = gif?.thumbnail
    }
}
