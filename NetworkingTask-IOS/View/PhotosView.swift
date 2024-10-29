//
//  PhotosViewController.swift
//  NetworkingTask-IOS
//
//  Created by Nurluay Sharifova on 14.10.24.
//

import UIKit
class PhotosView: UIViewController {
    
    var tableView = UITableView()
    var photosViewModel = PhotosViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpTableView()
        
        photosViewModel.getImages()
        photosViewModel.success = {
            self.tableView.reloadData()
        }
        photosViewModel.failure = { error in
                print(error)
        }
        
        
    }
    func setUpTableView () {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomPhotoTableCell.self, forCellReuseIdentifier: "CustomPhotoTableCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
            
        ])
    }
    
    
}
extension PhotosView : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.photosViewModel.photos.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = CustomPhotoTableCell(style: .default, reuseIdentifier: "CustomPhotoTableCell")
        cell.titleLabel.text = self.photosViewModel.photos[indexPath.row].title
        URLSession.shared.dataTask(with: NSURL(string: self.photosViewModel.photos[indexPath.row].thumbnailUrl ?? "")! as URL, completionHandler: { (data, response, error) -> Void in
            if error != nil {
                print(error ?? "No Error")
                return
            }
            DispatchQueue.main.async(execute: { () -> Void in
                cell.postImageView.image = UIImage(data: data!)
                
            })
            
        }).resume()
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = PhotoDetailView()
        
        URLSession.shared.dataTask(with: NSURL(string: self.photosViewModel.photos[indexPath.row].thumbnailUrl ?? "")! as URL, completionHandler: { (data, response, error) -> Void in
            if error != nil {
                print(error ?? "No Error")
                return
            }
            DispatchQueue.main.async(execute: { () -> Void in
                controller.detailImage.image = UIImage(data: data!)
                self.navigationController?.pushViewController(controller, animated: true)
                
            })
            
        }).resume()

    }
    
}
