//
//  UserEndpoint.swift
//  NetworkingTask-IOS
//
//  Created by Nurluay Sharifova on 29.10.24.
//

import Foundation
enum UserEndpoint {
    case users
    var url: String {
        switch self {
        case .users:
            return "\(Constants.apiUrl)/users"
            
        }
    }
}
