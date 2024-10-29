//
//  Post.swift
//  NetworkingTask-IOS
//
//  Created by Nurluay Sharifova on 15.10.24.
//

import Foundation
struct Post : Codable, TitleSubtitleCellProtocol {
    var id : Int?
    var title : String?
    var body : String?
    
    var titleText: String {
        title ?? ""
    }
    
    var subtitleText: String {
        body ?? ""
    }
}

struct Comment : Codable {
    var postId : Int?
    var name : String?
    var email : String?
    var body : String?
    
}
