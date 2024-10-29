//
//  CommentsViewModel.swift
//  NetworkingTask-IOS
//
//  Created by Nurluay Sharifova on 16.10.24.
//

import Foundation
class CommentsViewModel {
    var comment = [Comment]()
    let manager = PostManager()
    var success: (() -> Void)?
    var failure: ((String) -> Void)?
    
    func getComment(id: Int){
        manager.getPostComments(id:id) { items, error in
            if let error {
                self.failure?(error.localizedDescription)
            } else if let items {
                self.comment = items
                self.success?()
            }
        }
        
    }
}
