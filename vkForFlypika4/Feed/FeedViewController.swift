//
//  FeedViewController.swift
//  vkForFlypika4
//
//  Created by Аида on 21.06.21.
//

import UIKit

class FeedViewController: UIViewController {

    private let networkService: Networking = NetworkService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let params = ["filters": "post, photo"]
        networkService.request(path: API.newsFeed, params: params) { data, error in
            if let error = error {
                print("error \(error.localizedDescription)")
            }
            guard let data = data else { return }
            let json = try? JSONSerialization.jsonObject(with: data, options: [])
            print("json \(String(describing: json))")
        }

        
    }

}
