//
//  PostViewController.swift
//  NetworkingTask-IOS
//
//  Created by Nurluay Sharifova on 14.10.24.
//

import UIKit

class PostView: UIViewController {
    let tableView = UITableView()
    
    var postsViewModel = PostsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        
        postsViewModel.getPosts()
        postsViewModel.failure = { error in
            print(error)
        }
        postsViewModel.success = {
            self.tableView.reloadData()
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
extension PostView : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.postsViewModel.posts.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TitleSubtitleCell") as! TitleSubtitleCell
        let data = postsViewModel.posts[indexPath.row]
        cell.configure(data: data)
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = PostDetailView()
        controller.post = (self.postsViewModel.posts[indexPath.row])
        navigationController?.pushViewController(controller, animated: true)
    }
}
