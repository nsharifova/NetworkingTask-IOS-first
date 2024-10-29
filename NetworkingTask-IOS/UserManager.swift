//
//  UserManager.swift
//  NetworkingTask-IOS
//
//  Created by Nurluay Sharifova on 26.10.24.
//

import Foundation
class UserManager {
    var service = Service()
    func getUsers (completion: @escaping (([User]?, Error?)->Void)) {
        service.fetchData(urlPath: UserEndpoint.users.url, type: [User].self) { result in
            switch result {
            case .success(let success):
                completion(success, nil)
            case .failure(let failure):
                completion(nil, failure)
            }
        }
    }
}
