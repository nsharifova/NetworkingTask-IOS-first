//
//  User.swift
//  NetworkingTask-IOS
//
//  Created by Nurluay Sharifova on 14.10.24.
//

import Foundation

struct User: Codable, TitleSubtitleCellProtocol {
    var id : Int?
    var name : String?
    var username : String?
    var email : String?
    let address: Address?
    let phone: String?
    
    var titleText: String {
        name ?? ""
    }
    
    var subtitleText: String {
        email ?? ""
    }
    
}
struct Address: Codable {
    let street: String
    let suite: String
    let city: String
    let zipcode: String
}
