//
//  AlbumsViewModel.swift
//  NetworkingTask-IOS
//
//  Created by Nurluay Sharifova on 15.10.24.
//

import Foundation
class AlbumsViewModel{
    var album : [Albums] = []
    var albumManager = AlbumManager()
    var success : (()->Void)?
    var failure : ((String)->Void)?
    
    func getData() {
        albumManager.getAlbums { items,error in
            if let items {
                self.album = items
                self.success?()
                
            } else if let error {
                self.failure?(error.localizedDescription)
            }
            
        }
    }
}



