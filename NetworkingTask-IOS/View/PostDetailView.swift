//
//  PostDetailView.swift
//  NetworkingTask-IOS
//
//  Created by Nurluay Sharifova on 16.10.24.
//

import UIKit

class PostDetailView: UIViewController {
    var post: Post?
    var commentsViewModel = CommentsViewModel()
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(CommentCell.self, forCellReuseIdentifier: "CommentCell")
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commentsViewModel.getComment(id: post?.id ?? 0)
        commentsViewModel.success = {
            self.tableView.reloadData()
        }
        commentsViewModel.failure = { error in
            print(error)
        }
        setUpView()
    }
    
    func setUpView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    
}

extension PostDetailView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.commentsViewModel.comment.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommentCell", for: indexPath) as! CommentCell
        let comment = self.commentsViewModel.comment[indexPath.row]
        cell.configure(with: comment)
        return cell
    }
}


