//
//  PostViewModelProtocol.swift
//  NetworkingTask-IOS
//
//  Created by Nurluay Sharifova on 24.10.24.
//

import Foundation
protocol PostViewModelProtocol {
    func getPosts (completion : @escaping (Result<[Post],Error>) -> Void)
}
