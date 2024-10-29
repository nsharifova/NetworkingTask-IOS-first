//
//  TitleSubtitleCell.swift
//  NetworkingTask-IOS
//
//  Created by Samxal Quliyev  on 26.10.24.
//

import UIKit

protocol TitleSubtitleCellProtocol {
    var titleText: String { get }
    var subtitleText: String { get }
}

class TitleSubtitleCell: UITableViewCell {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subtitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func configure(data: TitleSubtitleCellProtocol) {
        titleLabel.text = data.titleText
        if data.subtitleText.isEmpty {
            subtitleLabel.isHidden = true
        } else {
            subtitleLabel.isHidden = false
            subtitleLabel.text = data.subtitleText
        }
    }
}
