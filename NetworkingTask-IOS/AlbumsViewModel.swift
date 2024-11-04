//
//  AlbumsViewModel.swift
//  NetworkingTask-IOS
//
//  Created by Nurluay Sharifova on 15.10.24.
//

import Foundation
class AlbumsViewModel : AlbumViewModelProtocol{
   
    
    var album : [Albums] = []
    var albumManager = AlbumManager()

    func getData(completion: @escaping (Result<[Albums], any Error>) -> Void) {
        albumManager.getAlbums { items , error in
            
            if let data = items {
                self.album = data
                completion(.success(data))

            }
            else if let error {
                completion(.failure(error.localizedDescription as! Error))
            }
            
        }

    }
   
}



