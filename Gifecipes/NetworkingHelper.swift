//
//  NetworkingHelper.swift
//  Gifecipes
//
//  Created by Sam Lee on 3/2/17.
//  Copyright © 2017 Sam Lee. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class NetworkingHelper {
    
    static let sharedInstance = NetworkingHelper()
    
    // Networking parameters
    let baseURL = "https://api.imgur.com/"
    var header = [String : String]()
    
    init() {
        // Get clientID from plist
        if let path = Bundle.main.path(forResource: "Keys", ofType: "plist") {
            let keys = NSDictionary(contentsOfFile: path)
            
            // Load client ID into header
            if let unwrappedKeys = keys {
                let clientID = unwrappedKeys["clientID"] as! String
                header["Authorization"] = "Client-ID \(clientID)"
            }
        }
    }
}

// Getting basic data
extension NetworkingHelper {
    
    func getImageURL(url: String) {
        
    }
    
    func getImageList(page: Int, completion: @escaping ([Gif]) -> Void) {
        Alamofire.request(baseURL + "3/gallery/r/gifrecipes/\(page)", headers: header).responseJSON { response in
            switch response.result {
            case .success:
                let data = JSON(response.result.value!)
                var processedGifs = [Gif]()
                for (_, value) in data["data"] {
                    let gif = Gif(name: value["title"].stringValue,
                                  id: value["id"].stringValue,
                                  url: value["link"].stringValue,
                                  height: value["height"].intValue,
                                  width: value["width"].intValue)
                    processedGifs.append(gif)
                }
                
                completion(processedGifs)
                
            case .failure(let error):
                print("An error occurred: \(error)")
            }
        }
    }
}

// MARK: - Getting image files
extension NetworkingHelper {
    
    func getThumbnail(gif: Gif, completion: @escaping (Data) -> Void) {
        Alamofire.request(baseURL + gif.id + "m.jpg", headers: header).responseData { (response) in
            switch response.result {
            case .success:
                let data = response.result.value!
                completion(data)
            case .failure(let error):
                print("An error occurred: \(error)")
            }
        }
    }
    
    func getGif() {
        
    }
}
