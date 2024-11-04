//
//  PostsViewModel.swift
//  NetworkingTask-IOS
//
//  Created by Nurluay Sharifova on 15.10.24.
//

import Foundation

class PostsViewModel : PostViewModelProtocol {
   
    
    var posts: [Post] = []
    let manager = PostManager()
    func getPosts(completion: @escaping (Result<[Post], any Error>) -> Void) {
        manager.getPostItems { items , error in
            
            if let data = items {
                self.posts = data
                completion(.success(data))

            }
            else if let error {
                completion(.failure(error.localizedDescription as! Error))
            }
            
        }

    }
    
}
