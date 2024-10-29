//
//  AlbumManager.swift
//  NetworkingTask-IOS
//
//  Created by Nurluay Sharifova on 26.10.24.
//

import Foundation
class AlbumManager {
    var service = Service()
    func getAlbums(completion : @escaping (([Albums]?,Error?)->Void)) {
        service.fetchData(urlPath: AlbumEndpoint.albums.url, type: [Albums].self) { result in
            switch result {
            case .success(let success):
                completion(success, nil)
            case .failure(let failure):
                completion(nil, failure)
                
            }
        }
    }
}
