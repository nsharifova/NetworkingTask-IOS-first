//
//  AlbumViewModelProtocol.swift
//  NetworkingTask-IOS
//
//  Created by Nurluay Sharifova on 24.10.24.
//

import Foundation
protocol AlbumViewModelProtocol {
    func getData(completion: @escaping (Result<[Albums], Error>) -> Void)
}
