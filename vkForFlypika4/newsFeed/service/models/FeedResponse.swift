//
//  FeedResponse.swift
//  vkForFlypika4
//
//  Created by Аида on 24.06.21.
//

import Foundation

struct FeedResponseWrapped: Decodable {
    let response: FeedResponse
}

struct FeedResponse: Decodable {
    var items: [FeedItem]
    var profiles: [Profile]
    var groups: [Group]
}
protocol profileRepresentable {
    var id: Int {get}
    var name: String {get}
    var photo: String {get}
}
struct Profile: Decodable, profileRepresentable {

    
    let id: Int
    let firstName: String
    let lastName: String
    let photo100: String
    
    var name: String {return firstName + " " + lastName}
    var photo: String {return photo100 }
}
struct Group: Decodable, profileRepresentable {
    
    let id: Int
    let name: String
    let photo100: String
    var photo: String {return photo100 }

}

struct FeedItem: Decodable {
    let sourceId: Int
    let postId: Int
    let text: String?
    let date: Double
    let comments: CountableItem?
    let likes: CountableItem?
    let reposts: CountableItem?
    let views: CountableItem?
    let attachments: [Attachments]?
}

struct CountableItem: Decodable {
    let count: Int
}
struct Attachments: Decodable {
    let photo: Photo?
}

struct Photo: Decodable {
    let sizes : [PhotoSize]
    
    var height: Int {
        return getPropperSize().height
    }
    var widht : Int {
        return getPropperSize().width
    }
    
    var srcBIG : String {
        return getPropperSize().url
    }
    private func getPropperSize() -> PhotoSize {
        if let sizeX = sizes.first(where: {$0.type == "x"}) {
            return sizeX
        } else if let fallBackSize = sizes.last {
            return fallBackSize
        } else {
            return PhotoSize(type: "wrong image", url: "wrong image", width: 0, height: 0)
        }
    }
}
struct PhotoSize: Decodable {
    let type : String
    let url : String
    let width : Int
    let height : Int
}
