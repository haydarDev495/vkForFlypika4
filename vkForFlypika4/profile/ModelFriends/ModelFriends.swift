//
//  ModelFriends.swift
//  vkForFlypika4
//
//  Created by Аида on 4.07.21.
//

import Foundation

struct ProfileDataFriends : Decodable {
    var response : MyResponse
}

struct MyResponse : Decodable {

    var count: Int
}


