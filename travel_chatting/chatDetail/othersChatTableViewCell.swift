//
//  othersChatTableViewCell.swift
//  travel_chatting
//
//  Created by Sammy Jung on 2024/01/14.
//

import UIKit

class othersChatTableViewCell: UITableViewCell {

    static let identifier:String = "othersChatTableViewCell"
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var otherProfileImage: UIImageView!
    
    @IBOutlet var chatTextView: UITextView!
    
    @IBOutlet var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        chatTextView.isEditable = false
        
        chatTextView.layer.borderWidth = 1
        chatTextView.layer.borderColor = UIColor.gray.cgColor
        chatTextView.layer.cornerRadius = 10
        
        nameLabel.textColor = .black
        nameLabel.font = .systemFont(ofSize: 14)
        
        dateLabel.textColor = .gray
        dateLabel.font = .systemFont(ofSize: 12)
        otherProfileImage.contentMode = .scaleAspectFit
        otherProfileImage.backgroundColor = .white
        
    }

    override func draw(_ rect: CGRect) {
        otherProfileImage.layer.cornerRadius =
        otherProfileImage.layer.frame.width / 2
        otherProfileImage.clipsToBounds =  true
    }

    
}
