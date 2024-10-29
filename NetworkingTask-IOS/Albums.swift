//
//  Albums.swift
//  NetworkingTask-IOS
//
//  Created by Nurluay Sharifova on 15.10.24.
//

import Foundation
struct Albums : Codable,TitleSubtitleCellProtocol {
    var title : String?
    var subtitle: String? 
    var titleText: String {
        title ?? ""
    }
    
    var subtitleText: String {
           subtitle ?? ""
       }
    
}
