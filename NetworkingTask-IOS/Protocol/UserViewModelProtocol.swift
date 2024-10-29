//
//  UserViewModelProtocol.swift
//  NetworkingTask-IOS
//
//  Created by Nurluay Sharifova on 23.10.24.
//

import Foundation
protocol UserViewModelProtocol {
    func getUsers(completion: @escaping (Result<[User], Error>) -> Void)
}
