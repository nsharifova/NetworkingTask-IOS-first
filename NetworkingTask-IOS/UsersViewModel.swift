//
//  UsersViewModel.swift
//  NetworkingTask-IOS
//
//  Created by Nurluay Sharifova on 14.10.24.
//

import Foundation

class UsersViewModel {
    var users = [User]()
    var userManager = UserManager()
    var success : (()->Void)?
    var failure : ((String)->Void)?
    
    func getUsers() {
        userManager.getUsers { items , error in
            if let items {
                self.users = items
                self.success?()
            }
            else if let error {
                self.failure?(error.localizedDescription)
            }
            
        }
    }
}
