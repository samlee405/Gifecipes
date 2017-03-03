//
//  GifTableViewController.swift
//  Gifecipes
//
//  Created by Sam Lee on 3/2/17.
//  Copyright © 2017 Sam Lee. All rights reserved.
//

import Foundation
import UIKit
import Alamofire //remove after abstraction

class GifTableViewController: UITableViewController {
    
    var gifs: [Gif] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        NetworkingHelper.sharedInstance.getImageList(page: 1, completion: addNewGifs)
    }
}

// MARK: - Networking completion handlers
extension GifTableViewController {
    
    func addNewGifs(newGifs: [Gif]) {
        self.gifs += newGifs
        print(gifs.count)
        tableView.reloadData()
    }
}

// MARK: - TableView protocols
extension GifTableViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gifs.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let gif = gifs[indexPath.row]
        let heightRatio = (Float(gif.height) / Float(gif.width)) // must be float to get precision
        let height = (Float(gif.height) * heightRatio) + 16
        
        return CGFloat(integerLiteral: Int(height))
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "gifTableViewCell", for: indexPath) as! GifTableViewCell
        
        cell.gif = gifs[indexPath.row]
//        cell.updateImageViewSize()
        cell.getThumbnail()

        return cell
    }
}
