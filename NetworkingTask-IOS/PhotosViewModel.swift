//
//  PhotosViewModel.swift
//  NetworkingTask-IOS
//
//  Created by Nurluay Sharifova on 15.10.24.
//

import Foundation
class PhotosViewModel {
    var photos : [Photo] = []
    var photoManager = PhotoManager()
    var success : (()->Void)?
    var failure : ((String)->Void)?
    
    func getImages() {
        photoManager.getPhotos {items,error in
            if let items {
                self.photos = items
                self.success?()
            }
            else if let error {
                self.failure?(error.localizedDescription)
            }
        }
        
    }
}




