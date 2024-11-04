//
//  AlbumsViewController.swift
//  NetworkingTask-IOS
//
//  Created by Nurluay Sharifova on 14.10.24.
//

import UIKit

class AlbumsView: UIViewController {
    
    
    let tableView = UITableView()
    var albumsViewModel = AlbumsViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        
        albumsViewModel.getData { result in
            DispatchQueue.main.async {
                switch result {
                case .success:
                    self.tableView.reloadData()
                case .failure(let error):
                    print(error)
                }
            }
        }
        
    }
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TitleSubtitleCell", bundle: nil), forCellReuseIdentifier: "TitleSubtitleCell")
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    
    
    
}
extension AlbumsView : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.albumsViewModel.album.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TitleSubtitleCell") as! TitleSubtitleCell
        let data = albumsViewModel.album[indexPath.row]
        cell.configure(data: data)
        return cell
    }
}
