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
        tableView.reloadData()
    }
    
    func assignImage(cell: GifTableViewCell) {
//        cell.gifImageView.image
    }
    
    func updateView() {
        tableView.reloadData()
    }
}

// MARK: - TableView protocols
extension GifTableViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gifs.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "gifTableViewCell", for: indexPath) as! GifTableViewCell
        
        cell.gif = gifs[indexPath.row]
        print(cell.gif!.url)
//        cell.getThumbnail()
        
        let header = ["Authorization" : "Client-ID d0125fa9cea3685"]
        Alamofire.request("https://api.imgur.com/" + cell.gif!.id + "m.gif", headers: header).responseData { (response) in
            switch response.result {
            case .success:
                let data = response.result.value!
                DispatchQueue.main.async {
                    cell.gifImageView.image = UIImage(data: data)
                }
                
            case .failure(let error):
                print("An error occurred: \(error)")
            }
        }
//        let url = URL(string: "https://api.imgur.com/" + cell.gif!.id)
//        let task = URLSession.shared.dataTask(with: url!) { data, response, error in
//            guard let data = data, error == nil else {
//                return
//            }
//            print(response)
//            
//            DispatchQueue.main.async() {
//                cell.gifImageView.image = UIImage(data: data)
//            }
//        }
//        task.resume()

        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
