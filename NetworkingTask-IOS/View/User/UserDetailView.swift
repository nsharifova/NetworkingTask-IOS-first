//
//  UserDetailViewController.swift
//  NetworkingTask-IOS
//
//  Created by Nurluay Sharifova on 15.10.24.
//

import UIKit

class UserDetailView: UIViewController {
    var user : User?
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    private var name : UILabel = {
        var name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    private var userName : UILabel = {
        var name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    private var userEmail : UILabel = {
        var email = UILabel()
        email.translatesAutoresizingMaskIntoConstraints = false
        return email
    }()
    private var userPhone : UILabel = {
        var phone = UILabel()
        phone.translatesAutoresizingMaskIntoConstraints = false
        return phone
    }()
    private var userCompany : UILabel = {
        var company = UILabel()
        company.translatesAutoresizingMaskIntoConstraints = false
        return company
    }()
    private var userAddress : UILabel = {
        var adress = UILabel()
        adress.translatesAutoresizingMaskIntoConstraints = false
        adress.numberOfLines = 0
        return adress
    }()
    
    func setUpView() {
        
        view.addSubview(userName)
        view.addSubview(name)
        view.addSubview(userEmail)
        view.addSubview(userPhone)
        view.addSubview(userAddress)
        view.addSubview(userCompany)
        name.text = "Name: \(user?.name ?? "N/A")"
        userName.text = "Username: \(user?.username ?? "N/A")"
        userEmail.text = "Email: \(user?.email ?? "N/A")"
        userPhone.text = "Phone: \(user?.phone ?? "N/A")"
        userAddress.text = "Address: \(user?.address?.city ?? ""),\(user?.address?.street ?? ""),\(user?.address?.suite ?? ""),\(user?.address?.zipcode ?? "")"
        
        NSLayoutConstraint.activate([
            name.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 4),
            name.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            
            userName.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 16),
            userName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            userName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            userEmail.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: 16),
            userEmail.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            userEmail.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            userPhone.topAnchor.constraint(equalTo: userEmail.bottomAnchor, constant: 16),
            userPhone.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            userPhone.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            userAddress.topAnchor.constraint(equalTo: userPhone.bottomAnchor, constant: 16),
            userAddress.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            userAddress.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            
            
            
        ])
        
    }
    
    
    
    
}
