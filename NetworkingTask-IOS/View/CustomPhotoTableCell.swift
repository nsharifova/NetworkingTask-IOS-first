//
//  CustomPhotoTableCell.swift
//  NetworkingTask-IOS
//
//  Created by Nurluay Sharifova on 15.10.24.
//

import UIKit

class CustomPhotoTableCell: UITableViewCell {
    let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
        setUpConstraints()
    }
    
    private func setupViews() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(postImageView)
    }
    func setUpConstraints () {
        NSLayoutConstraint.activate([
            postImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            postImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            postImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            postImageView.heightAnchor.constraint(equalToConstant: 200),
            titleLabel.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: postImageView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: postImageView.trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
