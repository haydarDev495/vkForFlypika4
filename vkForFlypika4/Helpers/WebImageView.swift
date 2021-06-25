//
//  WebImageView.swift
//  vkForFlypika4
//
//  Created by Аида on 25.06.21.
//

import Foundation
import  UIKit

class WebImageView: UIImageView {
    func set( imageURL : String) {
        guard let url = URL(string: imageURL)  else {return}
        
        if let cashedResponse = URLCache.shared.cachedResponse(for: URLRequest(url: url)) {
            self.image = UIImage(data: cashedResponse.data)
            print("from cached")
            return
        }
        
        print("from internet")
        let dataTask = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            DispatchQueue.main.async {
                if let data = data , let response = response {
                    self?.image = UIImage(data: data)
                    self?.hundlyLoadedImage(data: data, response: response)
                    
                }
            }
        }
        dataTask.resume()
    }
    private func hundlyLoadedImage(data: Data, response: URLResponse) {
        guard let responseURL = response.url  else {return}
        
        let cachedResponse = CachedURLResponse(response: response, data: data)
        
        URLCache.shared.storeCachedResponse(cachedResponse, for: URLRequest(url: responseURL))
    }
}
