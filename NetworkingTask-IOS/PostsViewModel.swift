//
//  PostsViewModel.swift
//  NetworkingTask-IOS
//
//  Created by Nurluay Sharifova on 15.10.24.
//

import Foundation

class PostsViewModel {
    var posts: [Post] = []
    let manager = PostManager()
    
    var success: (() -> Void)?
    var failure: ((String) -> Void)?
    
    func getPosts() {
        manager.getPostItems { items, error in
            if let error {
                self.failure?(error.localizedDescription)
            } else if let items {
                self.posts = items
                self.success?()
            }
        }
    }
}
