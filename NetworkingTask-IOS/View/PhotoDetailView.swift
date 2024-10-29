//
//  PhotoDetailView.swift
//  NetworkingTask-IOS
//
//  Created by Nurluay Sharifova on 15.10.24.
//

import UIKit

class PhotoDetailView: UIViewController {
    let detailImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setUpConstraints()
    }
    
    private func setupViews() {
        view.addSubview(detailImage)
    }
    func setUpConstraints () {
        NSLayoutConstraint.activate([
            detailImage.topAnchor.constraint(equalTo: view.topAnchor),
            detailImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            detailImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            detailImage.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            
            
        ])
    }
    
    
    
}
