//
//  Untitled.swift
//  NetworkingTask-IOS
//
//  Created by Samxal Quliyev  on 26.10.24.
//

class PostManager {
    let service = Service()
    
    func getPostItems(completion: @escaping (([Post]?, Error?) -> Void)) {
        service.fetchData(urlPath: PostEndpoint.posts.url, type: [Post].self) { result in
            switch result {
            case .success(let success):
                completion(success, nil)
            case .failure(let failure):
                completion(nil, failure)
            }
        }
    }
    func getPostComments(id:Int,completion: @escaping (([Comment]?, Error?) -> Void)) {
        service.fetchData(urlPath: PostEndpoint.postComments(postID: id).url, type: [Comment].self) { result in
            switch result {
            case .success(let success):
                completion(success,nil)
            case .failure(let failure):
                completion(nil, failure)
                
            }
        }
    }
}


