//
//  FeedViewController.swift
//  vkForFlypika4
//
//  Created by Аида on 21.06.21.
//

import UIKit

class FeedViewController: UIViewController {

//    private let networkService: Networking = NetworkService()
    private var fetcher : DataFetcher = NetworkDataFetcher(networking: NetworkService())
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetcher.getFeed { FeedResponse in
            guard let feedResponse = FeedResponse else {return}
            FeedResponse?.items.map({ FeedItem in
                print(FeedItem.date)
            })
        }
//        let params = ["filters": "post, photo"]
//        networkService.request(path: API.newsFeed, params: params) { data, error in
//            if let error = error {
//                print("error \(error.localizedDescription)")
//            }
//            let decoder = JSONDecoder()
//            decoder.keyDecodingStrategy = .convertFromSnakeCase
//            guard let data = data else { return }
//            let json = try? JSONSerialization.jsonObject(with: data, options: [])
//            print("json \(String(describing: json))")
//            let response = try? decoder.decode(FeedResponseWrapped.self, from: data)
////            print(response)
//            response?.response.items.map({ FeedItem  in
//                print(FeedItem.text)
//            })
//
//        }


    }

}
