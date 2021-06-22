//
//  Api.swift
//  vkForFlypika4
//
//  Created by Аида on 21.06.21.
//

import Foundation

struct API {
    //https://api.vk.com/method/newsfeed.get?filters=post&access_token=502f3bbe76cc153fc888ab27f2603de90cce5988c24a6ca72b2a8e571c34964c83ff988cf95c59481d0f8&v=5.131

    static let scheme = "https"
    static let host = "api.vk.com"
    static let newsFeed = "/method/newsfeed.get"
    
    static let version = "5.131"
    
}
// https://api.vk.com/method/newsfeed.get?v=5.131&access_token=502f3bbe76cc153fc888ab27f2603de90cce5988c24a6ca72b2a8e571c34964c83ff988cf95c59481d0f8&filters=post,photo
