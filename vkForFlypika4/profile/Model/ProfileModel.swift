//
//  ProfileModel.swift
//  vkForFlypika4
//
//  Created by Аида on 3.07.21.
//

import Foundation

struct ProfileData : Decodable {
    var response : Response
}

struct Response : Decodable {
    var city : City
    var country : Country
    var first_name : String
    var id : Int
    var last_name : String
    var home_town : String
    var status : String
    var bdate : String
//    var bdateVisibility: Int
}

struct City:Codable {
    var id : Int
    var title : String
}

struct Country : Decodable {
    var id : Int
    var title : String
}
