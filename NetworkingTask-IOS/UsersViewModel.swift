//
//  UsersViewModel.swift
//  NetworkingTask-IOS
//
//  Created by Nurluay Sharifova on 14.10.24.
//

import Foundation

class UsersViewModel : UserViewModelProtocol {
    var users : [User] = []
    var userManager = UserManager()
    
    func getUsers(completion: @escaping (Result<[User], any Error>) -> Void) {
        userManager.getUsers { items , error in
            
            if let data = items {
                self.users = data
                completion(.success(data))


            }
            else if let error {
                completion(.failure(error.localizedDescription as! Error))
            }
            
        }
    }
    
}
