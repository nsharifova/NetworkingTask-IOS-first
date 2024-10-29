//
//  PhotoEndpoint.swift
//  NetworkingTask-IOS
//
//  Created by Nurluay Sharifova on 29.10.24.
//

import Foundation
enum PhotoEndpoint {
    case photos
    
    var url: String {
        switch self {
        case .photos:
            return "\(Constants.apiUrl)/photos"
            
        }
    }
}

