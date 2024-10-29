//
//  ViewController.swift
//  NetworkingTask-IOS
//
//  Created by Nurluay Sharifova on 14.10.24.
//

import UIKit

class ViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpContoller()
    }
    func setUpContoller(){
        viewControllers = [
            createNavContoller(for: PostView(), title: NSLocalizedString("Posts", comment: ""), image: UIImage(systemName: "newspaper")!),
            createNavContoller(for: AlbumsView(), title: NSLocalizedString("Albums", comment: ""), image: UIImage(systemName: "doc.text")!),
            createNavContoller(for: PhotosView(), title: NSLocalizedString("Photos", comment: ""), image: UIImage(systemName: "photo")!),
            createNavContoller(for: UsersView(), title: NSLocalizedString("Users", comment: ""), image: UIImage(systemName: "person")!),
        ]
    }
    func createNavContoller (for rootViewController: UIViewController,title:String,image:UIImage)->UIViewController{
        let navContoller = UINavigationController(rootViewController: rootViewController)
        navContoller.tabBarItem.title = title
        navContoller.tabBarItem.image = image
        navContoller.navigationBar.prefersLargeTitles = true
        rootViewController.navigationItem.title = title
        return navContoller
        
    }
    
}

