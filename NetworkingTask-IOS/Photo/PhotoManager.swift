//
//  PhotoManager.swift
//  NetworkingTask-IOS
//
//  Created by Nurluay Sharifova on 26.10.24.
//

import Foundation
class PhotoManager {
    var service = Service()
    
    func getPhotos(completion: @escaping (([Photo]?, Error?) -> Void)) {
        service.fetchData(urlPath: PhotoEndpoint.photos.url, type: [Photo].self) { result in
            switch result {
            case .success(let success):
                completion(success, nil)
            case .failure(let failure):
                completion(nil, failure)
            }
        }
    }
}
