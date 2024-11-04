//
//  UsersViewController.swift
//  NetworkingTask-IOS
//
//  Created by Nurluay Sharifova on 14.10.24.
//

import UIKit

class UsersView: UIViewController {
    
    let tableView = UITableView()
    var userViewModel = UsersViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()

        userViewModel.getUsers { result in
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
extension UsersView : UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.userViewModel.users.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TitleSubtitleCell") as! TitleSubtitleCell
        let data = userViewModel.users[indexPath.row]
        cell.configure(data: data)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = UserDetailView()
        controller.user = (self.userViewModel.users[indexPath.row])
        navigationController?.pushViewController(controller, animated: true)
    }
    
}
