//
//  PhotosViewModel.swift
//  NetworkingTask-IOS
//
//  Created by Nurluay Sharifova on 15.10.24.
//

import Foundation
class PhotosViewModel:PhotoViewModelProtocol {
    
    
    var photos : [Photo] = []
    var photoManager = PhotoManager()

    func getImages(completion: @escaping (Result<[Photo], any Error>) -> Void) {
        photoManager.getPhotos { items , error in
            
            if let data = items {
                self.photos = data
                completion(.success(data))

            }
            else if let error {
                completion(.failure(error.localizedDescription as! Error))
            }
            
        }

    }
    }
   





