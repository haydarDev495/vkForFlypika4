//
//  Api.swift
//  vkForFlypika4
//
//  Created by Аида on 21.06.21.
//

import Foundation

struct API {
    //https://api.vk.com/method/users.get?user_ids=210700286&fields=bdate&access_token=533bacf01e11f55b536a565b57531ac114461ae8736d6506a3&v=5.131

    static let scheme = "https"
    static let host = "api.vk.com"
    static let version = "5.131"
    
    static let newsFeed = "/method/newsfeed.get"
}
