//
//  AlbumEndpoint.swift
//  NetworkingTask-IOS
//
//  Created by Nurluay Sharifova on 29.10.24.
//

import Foundation
enum AlbumEndpoint {
    case albums
    var url: String {
        switch self {
        case .albums:
            return "\(Constants.apiUrl)/albums"
            
        }
    }
}
