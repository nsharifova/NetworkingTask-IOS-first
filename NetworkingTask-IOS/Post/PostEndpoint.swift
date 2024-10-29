//
//  PostEndpoint.swift
//  NetworkingTask-IOS
//
//  Created by Samxal Quliyev  on 26.10.24.
//

import Foundation

enum PostEndpoint {
    case posts
    case postComments(postID: Int)

    var url: String {
        switch self {
        case .posts:
            return "\(Constants.apiUrl)/posts"
        case .postComments(let postID):
            return "\(Constants.apiUrl)/posts/\(postID)/comments"
        }
    }
}
