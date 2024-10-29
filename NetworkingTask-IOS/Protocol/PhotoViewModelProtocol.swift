//
//  PhotoViewModelProtocol.swift
//  NetworkingTask-IOS
//
//  Created by Nurluay Sharifova on 24.10.24.
//

import Foundation
protocol PhotoViewModelProtocol {
    func getImages(completion: @escaping (Result<[Photo], Error>) -> Void)
}
