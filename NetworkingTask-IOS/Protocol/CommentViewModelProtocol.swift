//
//  CommentViewModelProtocol.swift
//  NetworkingTask-IOS
//
//  Created by Nurluay Sharifova on 24.10.24.
//

import Foundation
protocol CommentViewModelProtocol {
    func getComment (id: Int,completion : @escaping (Result<[Comment],Error>) -> Void)

}
