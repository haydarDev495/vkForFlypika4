//
//  FeedViewController.swift
//  vkForFlypika4
//
//  Created by Аида on 21.06.21.
//

import UIKit

class FeedViewController: UIViewController {

    private let networkService = NetworkService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkService.getFeed()

        view.backgroundColor = .red
        
    }

}
