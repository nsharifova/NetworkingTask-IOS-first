//
//  CommentsViewModel.swift
//  NetworkingTask-IOS
//
//  Created by Nurluay Sharifova on 16.10.24.
//

import Foundation
class CommentsViewModel : CommentViewModelProtocol {
  
    
    var comment = [Comment]()
    let manager = PostManager()
    func getComment(id: Int, completion: @escaping (Result<[Comment], any Error>) -> Void) {
        manager.getPostComments(id:id) { items , error in
            
            if let data = items {
                self.comment = data
                completion(.success(data))

            }
            else if let error {
                completion(.failure(error.localizedDescription as! Error))
            }
            
        }

    }
  
}
